//
//  LocationView.swift
//  SwiftMap
//
//  Created by Felipe Coronado on 21/02/25.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var viewModel:LocationsViewModel
    
    
    
    var body: some View {
        
        ZStack{
            
            mapLayer
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
                
                locationsPreview
            }
        }
        .sheet(item: $viewModel.sheetLocation, onDismiss: nil){ location in
            LocationDetailView(location: location)
        }
    }
}



extension LocationsView{
    
    private var header :some View{
        
        VStack{
            Button(action: viewModel.toggleLocationsList) {
                Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
               // .animation(.none, value: viewModel.mapLocation)
                .overlay(alignment: .leading){
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                        .rotationEffect(Angle(
                            degrees: viewModel.showLocationsList ? 180 :0))
                }
            }
            
            if viewModel.showLocationsList{
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.3),radius: 20,x: 0,y:15)
        .padding()
    }
    
    
    private var mapLayer :some View{
        Map(position: $viewModel.mapRegion){
            ForEach(viewModel.locations) { location in
                Annotation(location.name, coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .scaleEffect(viewModel.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            viewModel.showNextLocation(location: location)
                    }
                }
            }
        }
    }
    
    private var locationsPreview :some View{
        ZStack{
            ForEach(viewModel.locations){ location in
                
                if viewModel.mapLocation == location{
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
            }
        }
    }
}


#Preview {
    
    LocationsView()
        .environmentObject(LocationsViewModel())
}


