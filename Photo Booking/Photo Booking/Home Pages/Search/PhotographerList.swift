//
//  PhotographerList.swift
//  Photo Booking
//
//  Created by Alex Yang on 12/3/24.
//

import SwiftUI

struct PhotographerList: View {
    var photographers: [Photographer]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(photographers, id: \.self) { photographer in
                    PhotographerProfile(image: photographer.image, provider: photographer.provider, price: photographer.price, location: photographer.location)
                }
                .padding(.horizontal)
            }
        }
    }
}
