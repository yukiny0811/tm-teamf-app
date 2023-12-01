//
//  HaikuViewController.swift
//  TeamFApp
//
//  Created by Yuki Kuwashima on 2023/12/02.
//

import TeamFLibrary

class HaikuViewController: UIViewController {
    
    @IBOutlet var haiku1Label: UILabel!
    @IBOutlet var haiku2Label: UILabel!
    @IBOutlet var haiku3Label: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    let post: Post
    
    init(post: Post) {
        self.post = post
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let haikuString = try! Util.breakHaiku(post.haiku)
        haiku1Label.text = haikuString.haiku1.tategaki
        haiku2Label.text = haikuString.haiku2.tategaki
        haiku3Label.text = haikuString.haiku3.tategaki
        imageView.image = post.image.jpeg()!
    }
}
struct HaikuView: UIViewControllerRepresentable {
    
    let vc: HaikuViewController
    
    init(vc: HaikuViewController) {
        self.vc = vc
    }
    func makeUIViewController(context: Context) -> HaikuViewController {
        vc
    }
    
    func updateUIViewController(_ uiViewController: HaikuViewController, context: Context) {
        
    }
    
}
