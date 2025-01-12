//
//  PhotographerProfile.swift
//  Photo Booking
//
//  Created by Alex Yang on 12/3/24.
//

import SwiftUI

struct PhotographerProfile: View {
    var image: String = "alexface"
    var provider: String = "Alex Yang Photographs"
    var price: String = "$50"
    var location: String = "Chapel Hill, NC"

    
    var body: some View {
        NavigationStack {
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                    .clipped()
                
                VStack (alignment: .leading){
                    Text(provider)
                        .foregroundStyle(.defaultBlack)
                    
                    HStack {
                        Image(systemName: "dollarsign.circle")
                        Text(price)
                    }
                    .foregroundStyle(.defaultGrey)
                    HStack {
                        Image(systemName: "map")
                        Text(location)
                    }
                    .foregroundStyle(.defaultGrey)
                }
                Spacer()
                
                NavigationLink("Select +") {
                    PhotographerView(photographer: .example)
                }
                .foregroundStyle(.defaultPurple)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(.defaultWhite)
                    .stroke(.defaultPurple, lineWidth: 0.5)
                            
                )
            }
        }
    }
}

#Preview {
    PhotographerProfile(image: "exampleface", provider: "test", price: "test", location: "test")
}
