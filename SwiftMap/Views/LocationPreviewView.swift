//
//  LocationPreviewView.swift
//  SwiftMap
//
//  Created by Felipe Coronado on 22/02/25.
//

import SwiftUI

struct LocationPreviewView: View {
    
    let location :Location
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16){
                imageSection
                titleSection
            }
             buttonsSection
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y:65)
        )
        .cornerRadius(10)
    }
}

extension LocationPreviewView{
    
    private var imageSection :some View{
        ZStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection :some View{
        VStack(alignment: .leading, spacing: 4){
            Text(location.name)
                .font( .title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font( .subheadline)
                .fontWeight(.bold)
        }
        
        .frame(maxWidth:.infinity, alignment: .leading)
       
    }
    
    
    private var buttonsSection :some View{
        VStack(spacing: 8){
            Button{
                viewModel.sheetLocation = location
            } label: {
                Text("Learn more")
                    .font(.headline)
                    .frame(width: 125, height: 35)
            }
            .buttonStyle(.borderedProminent)
            
            
            Button{
                viewModel.nextButtonPressed()
            } label: {
                Text("Next")
                    .font(.headline)
                    .frame(width: 125, height: 35)
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        LocationPreviewView(location: LocationsDataService.locations.first!)
           
    }.environmentObject(LocationsViewModel())
}
