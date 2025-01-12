//
//  LoginView.swift
//  Photo Booking
//
//  Created by Alex Yang on 11/30/24.
//

import SwiftUI

struct LoginView: View {
    @State private var user: String = ""
    @State private var password: String = ""
    @State private var loginErrorMessage: String?
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        
        NavigationStack {
            
            VStack (alignment: .leading, spacing: 10) {
                Text("Welcome Back!")
                    .font(.largeTitle)
                    .bold()
                
                .font(.callout)
                .padding(.bottom, 30)
                Text("Email or username")
                TextField("Enter email or username", text: $user)
                    .foregroundStyle(.secondary)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(.defaultPurple, lineWidth: 2))
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                
                    .padding(.bottom, 20)
                Text("Password")
                SecureField("Enter password", text: $password)
                    .foregroundStyle(.secondary)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .stroke(.defaultPurple, lineWidth: 2))
                    .textInputAutocapitalization(.never)

                
                    .padding(.bottom, 20)
                
                Button("Login") {
                    loginErrorMessage = nil
                    Task {
                        await loginUser()
                    }
                }
                .background(
                    NavigationLink(destination: HomeView(), isActive: $isLoggedIn) {
                   Text("Login")
                })
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(.defaultPurple))
                .foregroundStyle(.white)
                .disabled(user == "" || password == "")
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundStyle(.secondary)
                    NavigationLink (destination: SignUpView()) {
                        Text("Sign up here")
                            .underline()
                    }
                }
                
                if let errorMessage = loginErrorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                        .padding(.top, 10)
                }
            }
            .padding(.horizontal, 25)
            .padding(.bottom, 50)
            
        }
        .navigationBarBackButtonHidden()
    }
    private func loginUser() async {
            do {
                let isValid = try await UserService().validateUser(username: user, password: password)
                if isValid {
                    isLoggedIn.toggle()
                } else {
                    loginErrorMessage = "Invalid username or password"
                }
            } catch {
                loginErrorMessage = "Error: invalid username or password"
            }
        }
}

#Preview {
    LoginView()
}
