//
//  ContentView.swift
//  PlaceLookup Demo
//
//  Created by GuitarLearnerJas on 16/10/2024.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @EnvironmentObject var locationManager: LocationManager
    @State private var showPlaceLookupSheet: Bool = false
    @State var returnedPlace = Place(mapItem: MKMapItem())
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .resizable()
                    .frame(width: 140, height: 140)
                    .foregroundStyle(.tint)
                Text("Hello! You are currently at\n \(locationManager.location?.coordinate.latitude ?? 0.0), \(locationManager.location?.coordinate.longitude ?? 0.0)")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Your searched result is\n \(returnedPlace.name)\nCoords:\(returnedPlace.latitude), \(returnedPlace.longitude)")
                    .bold()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showPlaceLookupSheet.toggle()
                    } label: {
                        Text("Show Place Lookup")
                        Image(systemName: "magnifyingglass")
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showPlaceLookupSheet) {
            PlaceLookupView(returnedPlace: $returnedPlace)
        }
    }
}

#Preview {
    ContentView() //Preview wont show location, need to use simulator
        .environmentObject(LocationManager())
}
