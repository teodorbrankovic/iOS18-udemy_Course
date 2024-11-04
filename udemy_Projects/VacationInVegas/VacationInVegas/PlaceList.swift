//
//  PlaceList.swift
//  VacationInVegas
//
//  Created by Teodor Brankovic on 31.10.24.
//

import SwiftUI
import SwiftData
import MapKit

struct PlaceList: View {
    @Query(sort: \Place.name) private var places: [Place]
    
    @State private var showImages = false
    @State private var searchText = ""
    @State private var filteredByInterested = false
    
    @Namespace private var namespace
    
    private var predicate: Predicate<Place> {
        #Predicate<Place> {
            if !searchText.isEmpty && filteredByInterested {
                $0.name.localizedStandardContains(searchText) && $0.interested
            } else if !searchText.isEmpty {
                $0.name.localizedStandardContains(searchText)
            } else if filteredByInterested {
                $0.interested
            } else {
                true
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            
            List((try? places.filter(predicate)) ?? places) { place in // filter with predicate
                NavigationLink(value: place) {
                    HStack {
                        place.image
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 7))
                            .frame(width: 100, height: 100)
                        
                        Text(place.name)
                        
                        Spacer()
                        
                        if place.interested {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                                .padding(.trailing)
                        }
                    } // hs
                }
                .matchedTransitionSource(id: 1, in: namespace)
                .swipeActions(edge: .leading) {
                    Button(place.interested ? "Interested" : "Not Interested", systemImage: "star.fill") {
                        place.interested.toggle()
                    }
                    .tint(place.interested ? .yellow : .gray)
                }
            } // list
            .navigationTitle("Places")
            .searchable(text: $searchText, prompt: "Find a Place")
            .animation(.default, value: searchText)
            .navigationDestination(for: Place.self) { place in
                MapView(place: place, position: .camera(MapCamera(
                    centerCoordinate: place.location,
                    distance: 1000,
                    heading: 50,
                    pitch: 80
                )))
                .navigationTransition(.zoom(sourceID: 1, in: namespace))
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Show Image", systemImage: "photo") {
                        showImages.toggle()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button("Filter", systemImage: filteredByInterested ? "star.fill" : "star") {
                        withAnimation {
                            filteredByInterested.toggle()
                        }
                    }
                    .tint(filteredByInterested ? .yellow : .blue)
                }
            } // toolbar
            .sheet(isPresented: $showImages) {
                Scrolling()
            }
        } // ns
        
    }
}

#Preview {
    PlaceList()
        .modelContainer(Place.preview)
}
