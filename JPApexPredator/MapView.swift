//
//  MapView.swift
//  JPApexPredator
//
//  Created by Aravind vallabhaneni on 11/07/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let predators = Predators()
    @State var position: MapCameraPosition
    @State var satilliete = false
    
    var body: some View {
        Map(position: $position) {
            
            ForEach(predators.allApexPredators){ predator in
                Annotation(predator.name, coordinate: predator.location) {
                    Image(predator.Image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .shadow(color: .white,radius: 3)
                        .scaleEffect(x: -1)
                }
                
            }
        }
        .mapStyle(satilliete ? .imagery(elevation: .realistic)
                  : .standard(elevation: .realistic))
        .overlay(alignment: .bottomTrailing){
            Button {
                satilliete.toggle()
            } label: {
                Image(systemName: satilliete ? "globe.americas.fill" : "globe.americas")
                    .font(.title)
                    .imageScale(.large)
                    .padding(19)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(cornerRadius: 10))
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    
    MapView(position: .camera(MapCamera(
        centerCoordinate: Predators().allApexPredators[2].location,
        distance: 1000,
        heading: 250,
        pitch: 80 ))
    )
    .preferredColorScheme(.dark)
}
