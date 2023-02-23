//
//  DetailsView.swift
//  RestaurantApp
//
//  Created by Felipe Goncalves de Toledo on 23.02.23.
//

import MapKit
import SwiftUI
import CoreLocation

struct MapLocation: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct DetailsView: View {
    
    let restaurant: Restaurant?
    
    var body: some View {
        ZStack {
            
            Color(.systemOrange).ignoresSafeArea()
            
            VStack {
              
                URLImage(urlString: "https://www.citypng.com/public/uploads/preview/-51616861676gw5qikzxba.png")
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                                
                Text("Opening Hours:")
                    .bold()
                    .frame(width: 140)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)

                    
                ForEach(restaurant!.openinghours, id: \.self) { dailyHour in
                    Text(dailyHour)
                        .frame(width: 300)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
                
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(restaurant!.location.lat)!, longitude: Double(restaurant!.location.lon)!), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))), interactionModes: [.all],
                    annotationItems: [ MapLocation(name: restaurant!.name, coordinate: CLLocationCoordinate2D(latitude: Double(restaurant!.location.lat)!, longitude: Double(restaurant!.location.lon)!)) ],
                    annotationContent: { location in
                         MapMarker(coordinate: location.coordinate, tint: .red)
                    })
                    .frame(width: UIScreen.main.bounds.width, height: 300)

                
            }
               
        }
        .navigationTitle(restaurant?.name ?? "default value")
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(restaurant: nil)
    }
}
