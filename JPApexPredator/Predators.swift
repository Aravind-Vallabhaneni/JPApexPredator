//
//  Predators.swift
//  JPApexPredator
//
//  Created by Aravind vallabhaneni on 07/07/25.
//

// This file contains the class which decodes the data from the JSON file into swift usefull data

import Foundation

class Predators {
    var allApexPredators: [ApexPredator] = []
    var apexPredators: [ApexPredator] = []
    
    init(){
        decodeApexPredators()
    }
    
    func decodeApexPredators() {
        
        let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json")
        
        if let url {
            do {
                
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
                
            } catch {
                print("Error while decoding JSON \(error)")
            }
        } else {
            print("Unable to find the JSON file")
        }
    }
    
    func search(for searchText:String) -> [ApexPredator] {
        if searchText.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter{ predator in
                predator.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    func sort(by alphabetical:Bool) {
        
        apexPredators.sort{ predators1, Predators2 in
            if alphabetical {
                predators1.name < Predators2.name
            } else {
                predators1.id < Predators2.id
            }
        }
        
    }
    
    func filter(by type: apType) {

        if type != .all {
            apexPredators = allApexPredators.filter { predator in
                predator.type == type
            }
        } else {
            apexPredators = allApexPredators
        }
    }
}

