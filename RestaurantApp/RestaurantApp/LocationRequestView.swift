//
//  LocationRequestView.swift
//  RestaurantApp
//
//  Created by Felipe Goncalves de Toledo on 22.02.23.
//

import SwiftUI

struct LocationRequestView: View {
    var body: some View {
        ZStack {
            
            Color(.systemOrange).ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image(systemName: "paperplane.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)

                    .padding(.bottom, 32)
                
                Text("Would you like to explore restaurants nearby?")
                    .font(.system(size: 28, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Start sharing your location")
                    .frame(width: 140)
                    .multilineTextAlignment(.center)
                    .padding()
                    
                Spacer()
                
                VStack {
                    Button {
                        LocationManager.shared.requestLocation()
                    } label: {
                        Text("Allow location")
                            .padding()
                            .font(.headline)
                            .foregroundColor(Color(.systemOrange))
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.horizontal, -32)
                    .background(.white)
                    .clipShape(Capsule())
                    .padding()
                    
                    Button {
                        print("Dismiss")
                    } label: {
                        Text("Maybe later")
                            .padding()
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 32)
            }
            .foregroundColor(.white)
            
        }
    }
}

struct LocationRequestView_Previews: PreviewProvider {
    static var previews: some View {
        LocationRequestView()
    }
}
