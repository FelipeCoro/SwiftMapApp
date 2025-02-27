//
//  LocationsListView.swift
//  SwiftMap
//
//  Created by Felipe Coronado on 21/02/25.
//

import SwiftUI

struct LocationsListView: View {
    
    @EnvironmentObject private var  viewmodel :LocationsViewModel
    
    var body: some View {
        List{
            ForEach(viewmodel.locations){ location in
                Button{
                    viewmodel.showNextLocation(location: location)
                } label: {
                    listRowView(location:location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
                }
            }
            .listStyle(PlainListStyle())
        }
}



extension LocationsListView{
    
    private func listRowView(location :Location) -> some View {
        HStack{
            if let imageName = location.imageNames.first{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}
