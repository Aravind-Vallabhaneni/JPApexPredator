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
                        .overlay{
                            LinearGradient(stops: [
                                Gradient.Stop(color: .clear,location: 0.8),
                                Gradient.Stop(color: .black, location: 1)
                                    ], startPoint: .top, endPoint: .bottom)
                        }
                    
                    Image(predator.Image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
                VStack(alignment: .leading){
                    Text(predator.name)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Appears in:")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("•" + movie)
                            .font(.subheadline)
                    }
                    
                    Text("Movie Moments: ")
                        .font(.title)
                        .padding(.top, 15)
                        .fontWeight(.bold)
                    ForEach(predator.movieScenes){ movie in
                        
                        Text(movie.movie)
                            .font(.title2)
                            .padding(.vertical,1)
                            .fontWeight(.bold)
                        
                        Text(movie.sceneDescription)
                            .padding(.bottom,15)
                    }
                    
                    HStack {
                        Text("Read More :")
                            .fontWeight(.bold)
                        
                        Link("Jurassic Wiki", destination: URL(string: predator.link)!)
                            
                    }
                    .font(.title3)
                    
                }
                .padding()
                .padding(.bottom)
                .frame(width: geo.size.width, alignment: .leading)
            }
            .ignoresSafeArea()
        }
    }
}
#Preview {
    PredatorDetails(predator: Predators().allApexPredators[10])
}
