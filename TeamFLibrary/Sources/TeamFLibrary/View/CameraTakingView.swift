//
//  QueueView.swift
//  TeamFApp
//
//  Created by Yuki Kuwashima on 2023/11/30.
//

public struct CameraTakingView: View {
    
    @Binding var takePhoto: Bool
    
    var cameraVC = CameraViewController()
    
    public init(takePhoto: Binding<Bool>) {
        self._takePhoto = takePhoto
    }
    
    var cameraView: some View {
        CameraView(vc: cameraVC)
    }
    
    public var body: some View {
        ZStack {
            cameraView
        }
        .onChange(of: takePhoto) {
            if takePhoto {
                cameraVC.takePhoto()
                takePhoto = false
            }
        }
    }
}
