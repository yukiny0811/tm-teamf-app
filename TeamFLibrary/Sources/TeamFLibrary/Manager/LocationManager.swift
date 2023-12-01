//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2023/12/02.
//

import CoreLocation

public class LocationManager: NSObject, CLLocationManagerDelegate {
    
    public static let shared = LocationManager()
    
    public var manager = CLLocationManager()
        
    public override init() {
        super.init()
        manager.delegate = self
    }
    
    public func requestAuthorization() {
        manager.requestWhenInUseAuthorization()
    }
    
    public func getCurrentUserLocation() -> CLLocationCoordinate2D? {
        guard let location = manager.location else {
            return nil
        }
        return .init(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }
}
