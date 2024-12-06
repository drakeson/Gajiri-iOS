//
//  JobApplicationView.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//

import SwiftUI

struct JobApplicationView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var resumeURL: URL?
    @State private var isLoading = false
    @State private var submissionStatus: String?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Job Details
                    Text("Senior Software Engineer")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        Text("TechCorp Ltd.")
                        Spacer()
                        Text("Nairobi, Kenya")
                    }
                    .foregroundColor(.secondary)
                    
                    // Job Tags
                    HStack {
                        JobTagView(text: "Full-time")
                        JobTagView(text: "Remote")
                    }
                    
                    // Pay Estimate
                    Text("UGX 2,000,000 - UGX 3,500,000")
                        .foregroundColor(.accentColor)
                        .fontWeight(.semibold)
                    
                    // Job Description
                    Text("Job Description")
                        .font(.headline)
                    
                    Text("We are seeking a talented Senior Software Engineer to join our innovative team. The ideal candidate will have extensive experience in mobile and backend development...")
                        .foregroundColor(.secondary)
                    
                    // Application Form
                    VStack(spacing: 12) {
                        TextField("Full Name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(name.isEmpty ? Color.red : Color.clear, lineWidth: 1)
                            )
                        
                        TextField("Email Address", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke((email.isEmpty || !email.contains("@")) ? Color.red : Color.clear, lineWidth: 1)
                            )
                        
                        TextField("Phone Number", text: $phone)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.phonePad)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(phone.isEmpty ? Color.red : Color.clear, lineWidth: 1)
                            )
                        
                        // File Upload
                        Button(action: {
                            // Implement file picker
                        }) {
                            HStack {
                                Image(systemName: "paperclip")
                                Text(resumeURL?.lastPathComponent ?? "Upload Resume")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(8)
                        }
                        
                        // Submission Status
                        if let status = submissionStatus {
                            Text(status)
                                .foregroundColor(status.contains("Success") ? .green : .red)
                        }
                        
                        // Submit Button
                        Button(action: {
                            // Validate fields
                            guard !name.isEmpty,
                                  email.contains("@"),
                                  !phone.isEmpty else {
                                submissionStatus = "Please fill all required fields correctly"
                                return
                            }
                            
                            // Simulate application submission
                            isLoading = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isLoading = false
                                submissionStatus = "Application Submitted Successfully!"
                            }
                        }) {
                            HStack {
                                if isLoading {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                }
                                Text("Submit Application")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .disabled(isLoading)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Job Application")
        }
    }
}


struct JobApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        JobApplicationView()
    }
}
