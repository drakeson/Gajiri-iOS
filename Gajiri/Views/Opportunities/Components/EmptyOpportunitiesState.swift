//
//  EmptyOpportunitiesState.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//
import SwiftUI


struct EmptyOpportunitiesState: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "desktopcomputer")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .foregroundColor(.gray)
            
            Text("No opportunities yet?")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Stay tuned or update your profile for better matches!")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            
            Button(action: {
                // Navigate to profile update
            }) {
                Text("Update Profile")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

