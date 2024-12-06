//
//  JobOpportunityCard.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//

import SwiftUI

struct JobOpportunityCard: View {
    let job: JobOpportunity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Job Title and Employer
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(job.title)
                        .font(.headline)
                    Text(job.employer)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: "mappin.and.ellipse")
                    .foregroundColor(Color("AccentDark"))
            }
            
            // Location
            Text(job.location)
                .font(.caption)
                .foregroundColor(.secondary)
            
            // Description
            Text(job.description)
                .font(.body)
                .lineLimit(3)
            
            // Pay Estimate
            Text("Estimated Pay: \(job.payEstimate)")
                .font(.subheadline)
                .foregroundColor(.accentTeal)
            
            // Apply Now Button
            NavigationLink(destination: JobApplicationView()) {
                Text("Apply Now")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("AccentColor"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

// Category Header Subview
struct CategoryHeaderView: View {
    let category: OpportunityCategory
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(category.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
            
            Text(category.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(category.description)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}

// Job Listings Subview
struct JobListingsView: View {
    let jobs: [JobOpportunity]
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Available Opportunities")
                .font(.headline)
            
            ForEach(jobs) { job in
                JobListingCardView(job: job)
            }
        }
    }
}

// Job Listing Card View
struct JobListingCardView: View {
    let job: JobOpportunity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                VStack(alignment: .leading) {
                    Text(job.title)
                        .font(.headline)
                    Text(job.employer)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text(job.payEstimate)
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
            
            HStack {
                Text(job.location)
                Spacer()
                HStack {
                    ForEach(job.tags, id: \.self) { tag in
                        Text(tag)
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                }
            }
            .font(.caption)
            .foregroundColor(.secondary)
            Text(job.description)
            
            NavigationLink(destination: JobApplicationView()) {
                Text("View Details")
                    .frame(maxWidth: .infinity)
                    .background(Color("AccentColor"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .font(.headline)
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity)
        }
        .padding()
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

// Post a Job CTA Subview
struct PostJobButtonView: View {
    var body: some View {
        Button(action: {
            // Handle post job action
        }) {
            Text("Post a Job")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.accentColor)
                .cornerRadius(10)
        }
        .padding(.top, 20)
    }
}
