//
//  ContentView.swift
//  RestaurantApp
//
//  Created by Felipe Goncalves de Toledo on 21.02.23.
//

import SwiftUI

struct URLImage: View {
    
    let urlString: String
    
    @StateObject var viewModel = ViewModelImage()
    
    var body: some View {
        if let data = viewModel.data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
        } else {
            Image(systemName: "globe")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .onAppear {
                    viewModel.fetchImage(urlString: urlString)
                }
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var locationManager = LocationManager.shared
    
    @StateObject var viewModel = ViewModelContentView()
    
    var body: some View {
        Group {
            if locationManager.userLocation == nil {
                LocationRequestView()
            } else {
                NavigationStack {
                    List {
                        
                        ForEach(viewModel.restaurants, id: \.self) { restaurant in
                            NavigationLink(value: restaurant) {
                                HStack {
                                    URLImage(urlString: "https://www.citypng.com/public/uploads/preview/-51616861676gw5qikzxba.png")
                                    //URLImage(urlString: restaurant.presentationImage)
                                    VStack {
                                        Text(restaurant.name)
                                            .bold()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text(restaurant.kitchenTypes.description)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text("\(locationManager.calculateDistance(locationRest: restaurant.location)) km")
                                            .foregroundColor(Color.gray)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                                .padding(3)
                            }
                        }
                    }
                    .navigationTitle("Restaurants")
                    .navigationDestination(for: Restaurant.self) { restaurant in
                        DetailsView(restaurant: restaurant)
                    }
                    .onAppear {

                        viewModel.fetchRestaurants()
                    }
                }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
