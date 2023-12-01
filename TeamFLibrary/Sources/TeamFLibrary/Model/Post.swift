//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2023/12/02.
//

import Foundation

@Model
public class Post: Identifiable {
    
    public init(image: Data, haiku: String, lat: Double, lon: Double) {
        self.image = image
        self.haiku = haiku
        self.lat = lat
        self.lon = lon
    }
    
    public var id: String = UUID().uuidString
    
    @Attribute(.externalStorage)
    public var image: Data
    
    public var haiku: String
    
    public var date: Date = Date()
    
    public var lat: Double
    public var lon: Double
}
