//
//  PredatorDetails.swift
//  JPApexPredator
//
//  Created by Aravind vallabhaneni on 10/07/25.
//

import SwiftUI

struct PredatorDetails: View {
    let predator: ApexPredator
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                
                ZStack(alignment: .bottomTrailing) {
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    Image(predator.Image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                        
                        
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PredatorDetails(predator: Predators().allApexPredators[2])
}
