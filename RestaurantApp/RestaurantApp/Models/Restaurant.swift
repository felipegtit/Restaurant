//
//  Restaurant.swift
//  RestaurantApp
//
//  Created by Felipe Goncalves de Toledo on 21.02.23.
//

import Foundation

//Hashable so we can make a for loop over it, Codable so we can map it from JSON
struct Restaurant: Hashable, Codable {
    let name: String
    let presentationImage: String
    let kitchenTypes, openinghours: [String]
    let location: Location
}

struct Location: Hashable, Codable {
    let lon, lat: String
}
