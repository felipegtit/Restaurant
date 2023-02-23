//
//  ViewModelImage.swift
//  RestaurantApp
//
//  Created by Felipe Goncalves de Toledo on 22.02.23.
//

import Foundation

class ViewModelImage: ObservableObject {
    
    @Published var data: Data?
    
    func fetchImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data,_,_ in
            DispatchQueue.main.async {
                self.data = data
            }
           
        }
        task.resume()
    }
}
