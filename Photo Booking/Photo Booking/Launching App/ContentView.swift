//
//  ContentView.swift
//  Photo Booking
//
//  Created by Alex Yang on 11/12/24.
//

import SwiftUI


struct ContentView: View {
    @State private var isVisible = false
    @State private var navigateToNextView = false

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image("logo")
                    Text("Booking101")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.0)) {
                                isVisible = true
                            }
                            // Delay navigation by 2 seconds after animation
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                                navigateToNextView = true
                            }
                        }
                }
                .opacity(isVisible ? 1 : 0)
            }
            .background(
                NavigationLink(destination: BeginView(), isActive: $navigateToNextView) {
                    EmptyView()
                }
            )
        }
    }
}

#Preview {
    ContentView()
}

