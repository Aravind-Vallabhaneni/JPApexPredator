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
    let type: apColor
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    struct MovieScene: Decodable {
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
    
    enum apColor: String, Decodable {
        case land
        case air
        case sea
        
        var backgroundColor: Color {
            
            switch self {
                
            case .land:
                 .brown
            case .air:
                 .teal
            case .sea:
                 .blue
                
            }
        }
    }
    
}
