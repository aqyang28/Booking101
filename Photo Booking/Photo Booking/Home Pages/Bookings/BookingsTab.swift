//
//  BookingsView.swift
//  Photo Booking
//
//  Created by Alex Yang on 12/2/24.
//

import SwiftUI

struct BookingsTab: View {
    let bookings = [
        Booking(provider: "Example Photograph", location: "Chapel Hill", description: "Chill Guy graduation pictures", date: "March 12, 2024", price: "$1"),
        Booking(provider: "Alex Yang Photographs", location: "San Francisco", description: "NFL pictures", date: "November 24, 2024", price: "$1"),
        Booking(provider: "literally bob ross", location: "Manhattan", description: "Chill Guy wedding pictures", date: "Dec 1, 2024", price: "$0")
        ]
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                Text("Your Bookings")
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                HStack {
                    Text("Past")
                        .bold()
                        .foregroundColor(.purple)
                        .padding(.trailing)
                    Text("Upcoming")
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.vertical, 4)
                
                Divider()
                    .background(Color.purple)
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(bookings, id: \.self) { booking in
                            BookingView(booking: booking)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    BookingsTab()
}
