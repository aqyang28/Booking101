//
//  PhotographersView.swift
//  Photo Booking
//
//  Created by Alex Yang on 12/1/24.
//

import SwiftUI

struct PhotographerView: View {
    var photographer: Photographer
    
    var body: some View {
        
        TopHalf(photographer: photographer)
        
        Divider()
            .frame(height: 8)
            .background(.defaultLightGrey)
        
        VStack {
            HStack {
                Text("Portraits")
                    .padding(10)
                    .padding(.horizontal, 10)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.defaultLightPurple))
                    .foregroundStyle(.defaultPurple)
                    .bold()
                Text("Sports")
                    .padding(10)
                    .padding(.horizontal, 10)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.defaultWhite)
                        .stroke(.defaultLightGrey, lineWidth: 2))
                    .foregroundStyle(.defaultLightGrey)
                    .bold()
                Text("Events")
                    .padding(10)
                    .padding(.horizontal, 10)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.defaultWhite)
                        .stroke(.defaultLightGrey, lineWidth: 2))
                    .foregroundStyle(.defaultLightGrey)
                    .bold()
                
                Spacer()
                
                Image(systemName: "text.justify")
                    .frame(width: 40, height: 40)
                    .background(
                        Circle()
                            .fill(.defaultWhite)
                            .shadow(color: .defaultGrey, radius: 2)
                        )
            }
            .padding(10)
            
            Text("Portraits (4)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .bold()
                .foregroundStyle(.defaultBlack)
                .font(.title2)
            
            ScrollView(.horizontal) {
                HStack {
                    Image("samplePortrait1")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                    
                    Image("samplePortrait2")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                    
                    Image("samplePortrait3")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .frame(width: 200, height: 200)
                    
                    Image("samplePortrait4")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                }
            }
            Spacer()
        }
        .toolbar(.hidden, for: .tabBar)
    }
}


struct TopHalf: View {
    var photographer: Photographer


    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            HStack {
                Text(photographer.provider)
                    .bold()
                    .foregroundStyle(.defaultBlack)
                Spacer()
                HStack {
                    Image(systemName: "star")
                    Text("5.0")
                }
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(.defaultWhite)
                    .stroke(.defaultBlue, lineWidth: 1))
                .foregroundStyle(.defaultBlue)
                .bold()
            }
            
            HStack (spacing: 0) {
                ForEach(photographer.specialty.indices, id: \.self) { index in
                    Text("\(photographer.specialty[index])")
                    if index != photographer.specialty.indices.last {
                        Text(", ")
                    }
                }
            }
            .foregroundStyle(.defaultGrey)
            Text("\(photographer.location) • \(photographer.price) per session")
                .foregroundStyle(.defaultGrey)
            .padding(.bottom, 10)
            HStack (alignment: .bottom){
                Image(photographer.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipped()
                NavigationLink(destination: SelectDate()) {
                    Text("Book a session")
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(.defaultLightBlue)
                            .stroke(.defaultBlack, lineWidth: 1))
                        .foregroundStyle(.defaultBlack)
                        .bold()
                }
            }
        }
        .padding()
    }
}


#Preview {
    PhotographerView(photographer: .example)
}
