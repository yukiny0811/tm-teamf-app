//
//  HaikuViewController.swift
//  TeamFApp
//
//  Created by Yuki Kuwashima on 2023/12/02.
//

import TeamFLibrary

class HaikuViewController: UIViewController {
    
    //IBOutletここ
    
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
        //ラベルとかセット
    }
}

//ここはいじらない
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
