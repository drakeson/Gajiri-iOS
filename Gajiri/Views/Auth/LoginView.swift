//
//  LoginView.swift
//  Tutorial
//
//  Created by Kato Drake Smith on 18/11/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isSecureTextEntry = true

    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 20) {
                    // Logo
                    Image("ic_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        .padding(.bottom, 10)

                    // App Name
                    Text("G-Ajiri")
                        .font(.system(size: 32, weight: .bold))
                    
                    // Tagline
                    Text("Field Service Solution Providers")
                        .font(.system(size: 16))
                        .padding(.bottom, 20)

                    // Email TextField
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.caption)

                        TextField("Enter your email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                    }
                    .padding(.horizontal)

                    // Password TextField
                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.caption)
                            .foregroundColor(.gray)

                        HStack {
                            if isSecureTextEntry {
                                SecureField("Enter your password", text: $password)
                            } else {
                                TextField("Enter your password", text: $password)
                            }

                            Button(action: {
                                isSecureTextEntry.toggle()
                            }) {
                                Image(systemName: isSecureTextEntry ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.horizontal)

                    // Login Button
                    NavigationLink(destination: ContentView()) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("AccentColor"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .font(.headline)
                    }
                    .padding()

                    // Forgot Password
                    NavigationLink(destination: ForgotPasswordView()) {
                        Text("Forgot Password?")
                            .foregroundColor(Color("AccentColor"))
                    }
                }
                .padding()
            }
            .navigationBarHidden(true) // Hides the navigation bar on LoginView
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

