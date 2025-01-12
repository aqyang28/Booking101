//
//  ScheduleBookingView.swift
//  Photo Booking
//
//  Created by Alex Yang on 12/1/24.
//

import SwiftUI

struct SelectDate: View {
    
    @State var selectedDate: Date = Date()
    let startingDate: Date = Date()
    let endingDate: Date = Calendar.current.date(byAdding: .year, value: 1, to: Date()) ?? Date()
    
    var body: some View {
        NavigationStack {
            VStack {
                DatePicker("Select a date", selection: $selectedDate, in: startingDate...endingDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                
                NavigationLink(destination: ConfirmationScreen(selectedDate: selectedDate)) {
                    Text("Confirm Booking")
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(.blue)
                            .stroke(.defaultBlack, lineWidth: 2))
                        .foregroundStyle(.defaultWhite)
                }
            }
        }
        .toolbar(.visible, for: .tabBar)

    }
}

#Preview {
    SelectDate()
}
