//
//  HaikuViewController.swift
//  TeamFApp
//
//  Created by Yuki Kuwashima on 2023/12/02.
//

import TeamFLibrary
import UIKit

class HaikuPostViewController: UIViewController {
    
    //IBOutletここに書く
    
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
        // ラベルとかセットする
    }
    
    //IBActionここ
}

//ここはいじらない
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
