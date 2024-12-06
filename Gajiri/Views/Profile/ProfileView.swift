//
//  ProfileView.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var userName = "John Doe"
    @State private var email = "john.doe@example.com"
    @State private var skills = [
        SkillItem(name: "iOS Development", progress: 0.8),
        SkillItem(name: "Swift", progress: 0.9),
        SkillItem(name: "UI/UX Design", progress: 0.6)
    ]
    
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Profile Header
                    HStack {
                        Image("icon_ten")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(userName)
                                .font(.title)
                            Text(email)
                                .font(.subheadline)
                            
                            Button(action: {
                                // Edit Profile Action
                            }) {
                                Image(systemName: "pencil.circle.fill")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding(.leading)
                    }
                    .padding()
                    
                    // Skills Section
                    SectionHeader(title: "Skills & Certifications")
                    ForEach(skills) { skill in
                        SkillProgressView(skill: skill)
                    }
                    
                    // Activity Summary
                    SectionHeader(title: "Activity Summary")
                    ActivitySummaryView(
                        unreadMessages: 15,
                        jobsCompleted: 42,
                        averageRating: 4.7,
                        totalEarnings: "$5,600"
                    )
                    
                    // Account Settings
                    SectionHeader(title: "Account Settings")
                    SettingToggle(
                        label: "Notifications",
                        isEnabled: $notificationsEnabled
                    )
                    SettingToggle(
                        label: "Dark Mode",
                        isEnabled: $darkModeEnabled
                    )
                    
                    // Logout Button
                    Button(action: {
                        // Logout Action
                    }) {
                        Text("Logout")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .navigationTitle("Profile")
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
