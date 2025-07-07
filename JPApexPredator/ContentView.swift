//
//  ContentView.swift
//  JPApexPredator
//
//  Created by Aravind vallabhaneni on 05/07/25.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        let predators = Predators()

        List(predators.apexPredators) { predators in
            
            HStack{
                
                //Image
                Image(predators.Image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100,height: 100)
                    .shadow(color: .white, radius: 1)
                
                VStack(alignment: .leading) {
                    
                    Text(predators.name)
                        .fontWeight(.bold)
                    
                    //type
                    Text(predators.type.rawValue.capitalized)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 13)
                        .padding(.vertical, 5)
                        .background(predators.type.backgroundColor)
                        .clipShape(.capsule)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
