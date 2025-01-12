//
//  SelectTime.swift
//  Photo Booking
//
//  Created by Alex Yang on 12/2/24.
//

import SwiftUI

struct ConfirmationScreen: View {
    
    var selectedDate: Date
    var button: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                Text("Booking details:")
                    .bold()
                    .font(.largeTitle)
                Text("\(selectedDate)")
                    .font(.title)
            }
            .padding(.horizontal)
            .padding(.top, 30)
            .navigationTitle("Booking confirmed!")
            Spacer()
            
//            Button("Confirm Booking") {
//                print(numBookings)
//                numBookings += 1
//                print("yes \(numBookings)")
//            }
            NavigationLink(destination: HomeView()) {
                Text("Return Home")
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                        .stroke(.defaultBlack, lineWidth: 2))
                    .foregroundStyle(.defaultWhite)
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    ConfirmationScreen(selectedDate: Date())
}
