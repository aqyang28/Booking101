//
//  HomeView.swift
//  Photo Booking
//
//  Created by Alex Yang on 11/30/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Int = 0
    @State private var isLoggedOut = false
    
    var body: some View {
        if isLoggedOut {
            BeginView()
        } else {
            TabView {
                HomeTab()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .tag(0)
                SearchTab()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(1)
                BookingsTab()
                    .tabItem {
                        Image(systemName: "list.bullet")
                        Text("Bookings")
                    }
                    .tag(2)
                ProfileTab(isLoggedOut: $isLoggedOut)
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .tag(3)
            }
            .tint(.defaultPurple)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    HomeView()
}
