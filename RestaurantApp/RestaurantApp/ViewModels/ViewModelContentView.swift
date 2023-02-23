//
//  ViewModelHome.swift
//  RestaurantApp
//
//  Created by Felipe Goncalves de Toledo on 22.02.23.
//

import Foundation


class ViewModelContentView: ObservableObject {

    @Published var restaurants: [Restaurant] = []
    
    func fetchRestaurants() {
        guard let url = URL(string: "https://restaurantservice-dcrome.b4a.run/restaurants") else {
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            //Convert to JSON
            do {
                var restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                
                restaurants.sort {
                    LocationManager.shared.calculateDistance(locationRest: $0.location) < LocationManager.shared.calculateDistance(locationRest: $1.location)
                }
                
                DispatchQueue.main.async {
                    self?.restaurants = restaurants
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func getSections() -> Set<[String]> {
        return Set(restaurants.map { $0.kitchenTypes })
    }
    

}
