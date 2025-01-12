//
//  SearchPage.swift
//  Photo Booking
//
//  Created by Alex Yang on 12/2/24.
//

import SwiftUI

struct SearchTab: View {
    let photographers = [
        Photographer(image: "exampleface", provider: "Example Photographer", price: "$100", location: "Chapel Hill, NC", specialty: []),
        Photographer(image: "alexface", provider: "Alex Yang Photographs", price: "$50", location: "Cary, NC", specialty: ["Portrait", "Sports", "Special events"]),
        Photographer(image: "bobross", provider: "literally bob ross", price: "happiness", location: "Orlando, FL", specialty: ["Art"]),
        Photographer(image: "pal2tech", provider: "pal2tech my king", price: "$0", location: "Peachtree City, GA", specialty: ["Everything"]),
        Photographer(image: "simon", provider: "simon d'entremont my other king", price: "$1", location: "Nova Scotia, Canada", specialty: ["Nature and wildlife"]),
        Photographer(image: "mitch", provider: "mitch lally", price: "$100", location: "Australia", specialty: ["Portrait"]),
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack (spacing: 10) {
                    
                    Text("Nearby Photographers")
                        .bold()
                    
                    Spacer()
                    
                    Image(systemName: "magnifyingglass")
                        .bold()
                }
                .padding(.horizontal)
                .font(.title2)
                
                HStack {
                    Text("All (6)")
                        .padding(10)
                        .bold()
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.defaultGrey, lineWidth: 2)
                            .fill(.defaultLightPurple))
                        .foregroundStyle(.defaultPurple)
                    
                    Text("Chapel Hill (1)")
                        .padding(10)
                        .bold()
                        .padding(.horizontal, 5)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.defaultGrey, lineWidth: 2))
                        .foregroundStyle(.defaultGrey)
                    
                    Text("Cary (0)")
                        .padding(10)
                        .bold()
                        .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(.defaultGrey, lineWidth: 2))
                        .foregroundStyle(.defaultGrey)
                    
                    Spacer()
                    
                    Image(systemName: "text.justify")
                    
                }
                .padding()
                
                Text("All (6)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .font(.title)
                    .bold()
                
                PhotographerList(photographers: photographers)
            }
            .padding(.top, 10)
        }
        .navigationBarBackButtonHidden()
    }
}


#Preview {
    SearchTab()
}
