//
//  OpportunitiesCategoryView.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 26/11/2024.
//

import SwiftUI

struct OpportunityCategoryDetailsView: View {
    // Sample category and job data
    let category = OpportunityCategory(
        name: "Software Development",
        description: "Explore exciting opportunities in tech, from startups to global enterprises.",
        imageName: "software-dev-banner"
    )
    
    @State private var jobs: [JobOpportunity] = [
        JobOpportunity(
            id: "",
            title: "Senior iOS Developer",
            employer: "Tech Innovations Inc.",
            location: "Remote",
            description: "Looking for an experienced iOS developer to join our mobile team.",
            payEstimate: "$120,000 - $150,000",
            tags: ["Full-time", "Remote"]
        ),
        JobOpportunity(
            id: "",
            title: "Backend Engineer",
            employer: "Cloud Solutions LLC",
            location: "San Francisco, CA",
            description: "Build scalable backend services using modern cloud technologies.",
            payEstimate: "$110,000 - $140,000",
            tags: ["Full-time", "Hybrid"]
        )
    ]
    
    // Filter states
    @State private var selectedJobTypes: Set<String> = []
    @State private var selectedLocations: Set<String> = []
    @State private var sortOption: String = "Most Recent"
    
    var filteredJobs: [JobOpportunity] {
        jobs.filter { job in
            let jobTypeMatch = selectedJobTypes.isEmpty ||
                selectedJobTypes.contains(where: { job.tags.contains($0) })
            let locationMatch = selectedLocations.isEmpty ||
                selectedLocations.contains(job.location)
            return jobTypeMatch && locationMatch
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Category Header
                    CategoryHeaderView(category: category)
                    
                    // Filter Section
                    FilterSectionView(
                        selectedJobTypes: $selectedJobTypes,
                        selectedLocations: $selectedLocations,
                        sortOption: $sortOption
                    )
                    
                    // Job Listings
                    JobListingsView(jobs: filteredJobs)
                    
                    // Post a Job CTA
                    PostJobButtonView()
                }
                .padding()
            }
            .navigationTitle(category.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct OpportunityCategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OpportunityCategoryDetailsView()
    }
}

