//
//  ContentView.swift
//  JPApexPredator
//
//  Created by Aravind vallabhaneni on 05/07/25.
//

import SwiftUI

struct ContentView: View {

    @State var searchText: String = ""
    @State var alphabetical: Bool = false
    
    var body: some View {
        let predators = Predators()
        
        var filteredDinos: [ApexPredator] {
            predators.sort(by: alphabetical)
            return predators.search(for: searchText)
        }
        NavigationStack{
                List(filteredDinos) { predators in
                    NavigationLink{
                        Image(predators.Image)
                            .resizable()
                            .scaledToFit()
                        
                    } label: {
                        
                        HStack{
                            
                            Image(predators.Image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100,height: 100)
                                .shadow(color: .white, radius: 1)
                            
                            VStack(alignment: .leading) {
                                
                                Text(predators.name)
                                    .fontWeight(.bold)
                                
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
                }
                .navigationTitle("Apex Predators")
                .searchable(text: $searchText)
                .autocorrectionDisabled()
                .animation(.default, value: searchText)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            withAnimation {
                                alphabetical.toggle()
                            }
                        } label: {
                            Image(systemName: alphabetical ? "textformat" : "film")
                                .foregroundStyle(.white)
                                .fontWeight(.semibold)
                                .symbolEffect(.bounce, value: alphabetical)
                        }
                    }
                }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
