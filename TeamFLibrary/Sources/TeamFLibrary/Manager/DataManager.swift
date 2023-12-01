//
//  File.swift
//  
//
//  Created by Yuki Kuwashima on 2023/12/02.
//

import Foundation
import SwiftData

public enum DataManager {
    public static let container: ModelContainer = try! .init(
        for: Photo.self, Post.self,
        configurations: .init(isStoredInMemoryOnly: false)
    )
}
