//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2023/11/30.
//

import Foundation

@Model
public class Photo: Identifiable {
    
    public init(data: Data, lat: Double, lon: Double) {
        self.rawData = data
        self.lat = lat
        self.lon = lon
    }
    
    public var id: String = UUID().uuidString
    
    @Attribute(.externalStorage)
    public var rawData: Data
    
    @Attribute(.externalStorage)
    public var processedData: Data?
    
    public var haiku: String = ""
    
    public var date: Date = Date()
    
    public var lat: Double
    public var lon: Double
}
