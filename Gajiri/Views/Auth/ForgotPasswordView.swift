//
//  ForgotPasswordView.swift
//  Tutorial
//
//  Created by Kato Drake Smith on 19/11/2024.
//


import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email = ""
    @State private var showAlert = false
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
//                // Header with Back Button
//                HStack {
//                    Button(action: {
//                        presentationMode.wrappedValue.dismiss()
//                    }) {
//                        HStack {
//                            Image(systemName: "chevron.left")
//                            Text("Back")
//                        }
//                        .foregroundColor(Color("AccentColor"))
//                    }
//                    Spacer()
//                }
//                .padding(.horizontal)
                
                // Content
                VStack(spacing: 24) {
                    // Title and Description
                    VStack(spacing: 8) {
                        Text("Forgot Password")
                            .font(.system(size: 28, weight: .bold))
                        
                        Text("Enter your email address and we'll send you a link to reset your password")
                            .font(.system(size: 16))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding(.top, 40)
                    
                    // Email Input
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        TextField("Enter your email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                    }
                    .padding(.horizontal)
                    
                    // Reset Password Button
                    Button(action: {
                        sendResetLink()
                    }) {
                        ZStack {
                            Text("Send Reset Link")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(email.isEmpty ? Color.gray.opacity(0.3) : Color("AccentColor"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .font(.headline)
                            
                            if isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            }
                        }
                    }
                    .disabled(email.isEmpty || isLoading)
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Reset Link Sent"),
                message: Text("Please check your email for instructions to reset your password"),
                dismissButton: .default(Text("OK")) {
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
        .navigationTitle("Forgot Password")
    }
    
    private func sendResetLink() {
        isLoading = true
        
        // Simulate network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            isLoading = false
            showAlert = true
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
