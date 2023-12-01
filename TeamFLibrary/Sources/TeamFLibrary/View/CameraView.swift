//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2023/12/01.
//

import UIKit
import AVFoundation
import SwiftData

public class CameraViewController: UIViewController, AVCapturePhotoCaptureDelegate {

    var capturesession: AVCaptureSession!
    var cameraoutput: AVCapturePhotoOutput!
    var previewlayer: AVCaptureVideoPreviewLayer!
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        capturesession = AVCaptureSession()
        cameraoutput = AVCapturePhotoOutput()

        guard let device = AVCaptureDevice.default(for: .video) else { return }

        do {
            let input = try AVCaptureDeviceInput(device: device)

            if capturesession.canAddInput(input) && capturesession.canAddOutput(cameraoutput) {
                capturesession.addInput(input)
                capturesession.addOutput(cameraoutput)

                previewlayer = AVCaptureVideoPreviewLayer(session: capturesession)
                previewlayer.frame = view.bounds
                previewlayer.videoGravity = .resizeAspectFill
                view.layer.addSublayer(previewlayer)

                Task.detached {
                    await self.capturesession.startRunning()
                }
            }
        } catch {
            
        }
    }

    // ボタンが押された時のアクション
    public func takePhoto() {
        let settings = AVCapturePhotoSettings()
        cameraoutput.capturePhoto(with: settings, delegate: self)
    }
    
    public func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imagedata = photo.fileDataRepresentation() {
            guard let image = UIImage(data: imagedata) else {
                return
            }
            let location = LocationManager.shared.getCurrentUserLocation()!
            let waitingPhoto = Photo(
                data: image.jpegData(compressionQuality: 1)!,
                lat: location.latitude,
                lon: location.longitude
            )
            // 撮影した写真の処理や表示などを行う
            DataManager.container.mainContext.insert(waitingPhoto)
            try? DataManager.container.mainContext.save()
            
            Task {
                let haiku = try await ChatGPT.generateHaiku(from: image)
                waitingPhoto.haiku = haiku
                let processedPhoto = try await ChatGPT.generateImage(from: haiku)
                waitingPhoto.processedData = processedPhoto.png
                try DataManager.container.mainContext.save()
            }
        }
    }
}

public struct CameraView: UIViewControllerRepresentable {
    
    @Environment(\.modelContext) var modelContext
    
    let vc: CameraViewController
    
    public init(vc: CameraViewController) {
        self.vc = vc
    }
    public func makeUIViewController(context: Context) -> CameraViewController {
        vc
    }
    
    public func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
        
    }
    
    public typealias UIViewControllerType = CameraViewController
    
}
