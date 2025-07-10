//
//  ApexPredator.swift
//  JPApexPredator
//
//  Created by Aravind vallabhaneni on 05/07/25.
//

// This file is the data model of the json data

import SwiftUI
struct ApexPredator: Decodable,Identifiable {
    
    let id: Int
    let name: String
    let type: apType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    struct MovieScene: Decodable, Identifiable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
    var Image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
//This code can also be used, for assiging the background color for the type, but it is not type safe
//    var TypeColor: Color {
//        switch(type) {
//            
//        case "air":
//                .teal
//        case "sea":
//                .blue
//        default:
//                .brown
//        }
//    }
    
    // This version is cleaner, safer, and more extensible
    
  
}
enum apType: String, Decodable,CaseIterable,Identifiable {
    case all
    case land
    case air
    case sea
    
    var id: apType {
        self
    }
    
    var backgroundColor: Color {
        
        switch self {
        case .all:
                .black
        case .land:
                .brown
        case .air:
                .teal
        case .sea:
                .blue
        
        }
    }
    
    var icon: String {
        
        switch self {
        case .all:
            "square.stack.3d.up.fill"
        case .land:
            "leaf.fill"
        case .air:
            "wind"
        case .sea:
            "drop.fill"
        }
    }
}

