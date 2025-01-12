//
//  ProfileTab.swift
//  Photo Booking
//
//  Created by Alex Yang on 12/2/24.
//

import SwiftUI

struct ProfileTab: View {
    @State private var navigate = false
    @Binding var isLoggedOut: Bool
    
    var body: some View {
        
        NavigationStack {
            Text("Profile Tab")
            Button("Sign out") {
                signOut()
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(.defaultPurple))
            .foregroundStyle(.white)
            .navigationDestination(isPresented: $navigate) {
                BeginView()
            }
        }
    }
    
    func signOut() {
        UserDefaults.standard.removeObject(forKey: "authToken")
        isLoggedOut = true
        navigate = true
    }
}


#Preview {
    ProfileTab(isLoggedOut: .constant(false))
}
