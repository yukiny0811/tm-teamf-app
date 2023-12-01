//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2023/12/01.
//

import UIKit
import OpenAI
import ChatGPTManager

extension String: Error {}

public enum ChatGPT {
    
}

// haiku generation
extension ChatGPT {
    
    struct InputData: Codable {
        var imageurl: String
    }
    
    struct OutputData: Decodable {
        
        struct Header: Decodable {
            var contentType: String
            
            enum CodingKeys: String, CodingKey {
                case contentType = "Content-Type"
            }
            
            init(from decoder: Decoder) throws {
                let container: KeyedDecodingContainer<ChatGPT.OutputData.Header.CodingKeys> = try decoder.container(keyedBy: ChatGPT.OutputData.Header.CodingKeys.self)
                self.contentType = try container.decode(String.self, forKey: ChatGPT.OutputData.Header.CodingKeys.contentType)
            }
        }
        
        struct Body: Decodable {
            var content: String
        }
        
        var headers: Header
        var body: Body
    }
    
    public static func generateHaiku(from image: UIImage) async throws -> String {
        guard let url = URL(string: ChatGPTKey.getLambdaAPI()) else {
            throw "Lambda APIにアクセスできません"
        }
        guard let base64ImageURL = Util.convertImageToBase64(image) else {
            throw "画像のbase64へのエンコードに失敗しました"
        }
        let payload = InputData(imageurl: base64ImageURL)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(payload)
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoded = try JSONDecoder().decode(OutputData.self, from: data)
        return decoded.body.content
    }
}

// haiku2img
extension ChatGPT {
    
    public static func generateImage(from haiku: String) async throws -> UIImage {
        let openAI = OpenAI(apiToken: ChatGPTKey.getOpenAIAccessKey())
        let processedHaiku = haiku.replacingOccurrences(of: "\n", with: "")
        let prompt = "この俳句を表現する、できるだけ綺麗な風景の画像を生成してください。「\(processedHaiku)」"
        let imageQuery = ImagesQuery(prompt: prompt, n: 1, size: "512x512")
        let result = try await openAI.images(query: imageQuery)
        guard let imageRawData = result.data.first else {
            throw "画像が生成されませんでした"
        }
        guard let generatedImageURLString = imageRawData.url else {
            throw "生成された画像のURLが無効です"
        }
        guard let generatedImageURL = URL(string: generatedImageURLString) else {
            throw "生成された画像のURLが無効です"
        }
        let generatedData = try Data(contentsOf: generatedImageURL)
        guard let resultImage = UIImage(data: generatedData) else {
            throw "UIImageの生成に失敗しました"
        }
        return resultImage
    }
}
