//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2023/12/01.
//

extension Util {
    public static func convertImageToBase64(_ image: UIImage) -> String? {
        guard let imageData = image.pngData() else { return nil }
        return imageData.base64EncodedString()
    }
    
    @MainActor
    public static func postPhoto(_ photo: Photo) {
        let post = Post(image: photo.processedData!, haiku: photo.haiku, lat: photo.lat, lon: photo.lon)
        DataManager.container.mainContext.insert(post)
        DataManager.container.mainContext.delete(photo)
    }
    
    public static func breakHaiku(_ haiku: String) throws -> (haiku1: String, haiku2: String, haiku3: String) {
        let splitted = haiku.split(separator: "\n")
        let mapped = splitted.map { String($0) }
        guard mapped.count == 3 else {
            throw "俳句になっていません"
        }
        return (mapped[0], mapped[1], mapped[2])
    }
}
