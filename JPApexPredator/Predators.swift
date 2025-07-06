//
//  Predators.swift
//  JPApexPredator
//
//  Created by Aravind vallabhaneni on 07/07/25.
//

// This file contains the class which decodes the data from the JSON file into swift usefull data

import Foundation

class Predators {
    var apexPredators: [ApexPredator] = []
    
    init(){
        decodeApexPredators()
    }
    
    func decodeApexPredators() {
        
        let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "JSON")
        
        if let url {
            do {
                
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
                
            } catch {
                print("Error while decoding JSON \(error)")
            }
        } else {
            print("Unable to find the JSON file")
        }
    }
}

