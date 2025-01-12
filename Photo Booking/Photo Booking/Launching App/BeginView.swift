//
//  BeginView.swift
//  Photo Booking
//
//  Created by Alex Yang on 11/30/24.
//

import SwiftUI

struct BeginView: View {
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .scaledToFit()
                Text("Simplify your booking process")
                    .bold()
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                Text("Who doesn't like easy?")
                    .foregroundStyle(.opacity(0.8))
                    .font(.callout)
                    .padding(.bottom)
                
                
                HStack (spacing: 50) {
                    LoginButton()
                    SignUpButton()
                }
                .padding(.top, 10)
                .padding(.horizontal)
            }
            .padding(.top)
            .padding(.horizontal)
        }
    }
}

struct LoginButton: View {

    var body: some View {
        NavigationStack {
            NavigationLink(destination: LoginView()) {
                Text("Login".uppercased())
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: 170, maxHeight: 50)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.defaultGrey))
            }
        }
    }
}
struct SignUpButton: View {
    
    var body: some View {
        NavigationStack {
            NavigationLink (destination: SignUpView()) {
                Text("Sign Up".uppercased())
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: 170, maxHeight: 50)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.defaultGrey))

            }
        }
        .navigationBarBackButtonHidden()
    }
}


#Preview {
    BeginView()
}
