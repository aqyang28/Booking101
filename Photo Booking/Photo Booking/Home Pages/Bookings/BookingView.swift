//
//  BookingView.swift
//  Photo Booking
//
//  Created by Alex Yang on 12/3/24.
//

import SwiftUI

struct BookingView: View {
    let booking: Booking
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(booking.provider)
                        .font(.headline)
                        .bold()
                    Spacer()
                    VStack {
                        Image(systemName: "heart")
                            .foregroundColor(.purple)
                        Text("Favorite")
                            .font(.caption)
                            .foregroundColor(.purple)
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(booking.location)")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    Text(booking.description)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    Text("\(booking.date) • \(booking.price)")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                .padding(.bottom, 10)
                NavigationLink(destination: PhotographerView(photographer: .example)) {
                    Text("Reorder Booking")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.purple, lineWidth: 2)
                        )
                }
                .foregroundColor(.purple)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white)
                    .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
            )
        }
    }
}
#Preview {
    BookingView(booking: Booking(provider: "test", location: "test", description: "test", date: "test", price: "test"))
}
