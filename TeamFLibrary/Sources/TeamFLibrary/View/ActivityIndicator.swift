//
//  File.swift
//
//
//  Created by Yuki Kuwashima on 2023/11/30.
//

public struct ActivityIndicator: UIViewRepresentable {
    public init() {}
    public func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}
