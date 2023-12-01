//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2023/12/01.
//

extension UIImage {
    public var png: Data {
        self.pngData()!
    }
}
extension UIImage.Orientation {
    /// 画像が横向きであるか
    public var isLandscape: Bool {
        switch self {
        case .up, .down, .upMirrored, .downMirrored:
            return false
        case .left, .right, .leftMirrored, .rightMirrored:
            return true
        @unknown default:
            return false
        }
    }
}
extension CGRect {
    public var switched: CGRect {
        return CGRect(x: minY, y: minX, width: height, height: width)
    }
}
extension UIImage {
    public func cropping(to rect: CGRect) -> UIImage? {
        let croppingRect: CGRect = imageOrientation.isLandscape ? rect.switched : rect
        guard let cgImage: CGImage = self.cgImage?.cropping(to: croppingRect) else { return nil }
        let cropped: UIImage = UIImage(cgImage: cgImage, scale: scale, orientation: imageOrientation)
        return cropped
    }
}

extension String {
    public var tategaki: String {
        let temp = self.replacingOccurrences(of: "\n", with: "")
        var result = ""
        for t in temp {
            result += String(t)
            result += "\n"
        }
        return result
    }
}
