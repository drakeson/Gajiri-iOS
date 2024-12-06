//
//  SectionHeader.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//

import SwiftUI

struct SectionHeader: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .padding(.horizontal)
    }
}

struct SkillProgressView: View {
    let skill: SkillItem
    
    var body: some View {
        HStack {
            Text(skill.name)
            Spacer()
            ProgressView(value: skill.progress)
                .progressViewStyle(LinearProgressViewStyle())
                .frame(width: 100)
        }
        .padding(.horizontal)
    }
}

struct ActivitySummaryView: View {
    let unreadMessages: Int
    let jobsCompleted: Int
    let averageRating: Double
    let totalEarnings: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Messages: \(unreadMessages) Unread")
            Text("Jobs Completed: \(jobsCompleted)")
            Text("Average Rating: \(String(format: "%.1f", averageRating))")
            Text("Total Earnings: \(totalEarnings)")
        }
        .padding(.horizontal)
    }
}

struct SettingToggle: View {
    let label: String
    @Binding var isEnabled: Bool
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Toggle("", isOn: $isEnabled)
        }
        .padding(.horizontal)
    }
}
