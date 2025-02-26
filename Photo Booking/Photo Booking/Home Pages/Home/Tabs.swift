//
//  Tabs.swift
//  Photo Booking
//
//  Created by Alex Yang on 12/3/24.
//

import SwiftUI

struct Tabs: View {
    var body: some View {
        TabView {
            ZStack {
                Image("photographer1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 300)
                Text("Browse Photographers")
                    .foregroundStyle(.defaultWhite)
                    .bold()
                    .font(.title)
            }
            
            ZStack {
                Image("photographer2")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 400, height: 300)
                            .clipped()
                        Text("Schedule photoshoots")
                        .foregroundStyle(.defaultWhite)
                            .bold()
                            .font(.title)
                    }
                    .frame(width: 400, height: 300)

            ZStack {
                Image("photographer3")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 300)
                    .clipped()
                Text("Manage bookings")
                    .foregroundStyle(.defaultWhite)
                    .bold()
                    .font(.title)
            }
            .frame(width: 400, height: 300)
        }
//        .tabViewStyle(PageTabViewStyle())
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(width: 350, height: 250)
    }
}


#Preview {
    Tabs()
}
