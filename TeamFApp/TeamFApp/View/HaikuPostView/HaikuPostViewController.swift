//
//  HaikuViewController.swift
//  TeamFApp
//
//  Created by Yuki Kuwashima on 2023/12/02.
//

import TeamFLibrary
import UIKit

class HaikuPostViewController: UIViewController {
    
    @IBOutlet var haiku1Label: UILabel!
    @IBOutlet var haiku2Label: UILabel!
    @IBOutlet var haiku3Label: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    let photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let haikuString = try! Util.breakHaiku(photo.haiku)
        haiku1Label.text = haikuString.haiku1.tategaki
        haiku2Label.text = haikuString.haiku2.tategaki
        haiku3Label.text = haikuString.haiku3.tategaki
        imageView.image = photo.processedData!.jpeg()!
    }
    
    @IBAction func post() {
        Util.postPhoto(photo)
        self.dismiss(animated: true)
    }
}
struct HaikuPostView: UIViewControllerRepresentable {
    
    let vc: HaikuPostViewController
    
    init(vc: HaikuPostViewController) {
        self.vc = vc
    }
    func makeUIViewController(context: Context) -> HaikuPostViewController {
        vc
    }
    
    func updateUIViewController(_ uiViewController: HaikuPostViewController, context: Context) {
        
    }
    
}
