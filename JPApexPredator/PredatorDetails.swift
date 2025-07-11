//
//  PredatorDetails.swift
//  JPApexPredator
//
//  Created by Aravind vallabhaneni on 10/07/25.
//

import SwiftUI
import MapKit


struct PredatorDetails: View {
    let predator: ApexPredator
    @State var position: MapCameraPosition
    @Namespace var namespace
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
                    
                    
                    NavigationLink{
                        MapView(position: .camera(MapCamera(
                            centerCoordinate: predator.location,
                            distance: 1000,
                            heading: 250,
                            pitch: 80 ))
                        )
                        .navigationTransition(.zoom(sourceID: 1, in: namespace))
                    } label: {
                        Map(position: $position){
                            Annotation(predator.name, coordinate: predator.location) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.title)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse )
                            }
                            .annotationTitles(.hidden)
                        }
                        .matchedTransitionSource(id: 1, in: namespace)
                        .frame(height: 150)
                        .overlay(alignment: .topLeading) {
                            Text("Current Location")
                                .padding([.leading,.bottom],5)
                                .padding(.trailing, 8)
                                .background(.black.opacity(0.33))
                                .clipShape(.rect(bottomTrailingRadius: 15))
                        }
                        .overlay(alignment: .trailing) {
                            Image(systemName: "greaterthan")
                                .imageScale(.large)
                                .font(.title3)
                                .padding(.trailing, 5)
                        }
                        .clipShape(.rect(cornerRadius: 15))
                    }
                    
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
                            .foregroundStyle(.blue)
                            
                    }
                    .font(.title3)
                    
                }
                .padding()
                .padding(.bottom)
                .frame(width: geo.size.width, alignment: .leading)
            }
            .ignoresSafeArea()
            .toolbarBackground(.automatic)
        }
    }
}
#Preview {
    
    let predator = Predators().allApexPredators[10]
    
    NavigationStack {
        PredatorDetails(predator: predator,
                        position: .camera(MapCamera(centerCoordinate: predator.location, distance: 30000
                                                   )))
        .preferredColorScheme(.dark)
    }
}
