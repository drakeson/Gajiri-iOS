//
//  OpportunitiesView.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//

import SwiftUI

struct OpportunitiesView: View {
    // Sample job opportunities
    private let jobOpportunities: [JobOpportunity] = [
        JobOpportunity(
            id: "1",
            title: "Senior Software Engineer",
            employer: "Tech Innovations Inc.",
            location: "San Francisco, CA",
            description: "Seeking an experienced software engineer to develop cutting-edge web applications.",
            payEstimate: "$120,000 - $150,000",
            tags: ["Swift", "Kotlin", "UI/UX"]
        ),
        JobOpportunity(
            id: "2",
            title: "UX Designer",
            employer: "Creative Solutions LLC",
            location: "New York, NY",
            description: "Design intuitive and innovative user experiences for mobile and web platforms.",
            payEstimate: "$90,000 - $110,000",
            tags: ["Swift", "Kotlin", "UI/UX"]
        ),
        JobOpportunity(
            id: "3",
            title: "Digital Marketing Specialist",
            employer: "Growth Enterprises",
            location: "Remote",
            description: "Develop and implement comprehensive digital marketing strategies.",
            payEstimate: "$75,000 - $95,000",
            tags: ["Swift", "Kotlin", "UI/UX"]
        )
    ]
    
    // State for filter and sort
    @State private var showFilterSheet = false
    
    var body: some View {
        NavigationView {
            VStack {
                if jobOpportunities.isEmpty {
                    EmptyOpportunitiesState()
                } else {
                    List {
                        ForEach(jobOpportunities) { job in
                            JobOpportunityCard(job: job)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Find Opportunities")
            .navigationBarItems(
                trailing: HStack {
                    Button(action: { /* Sort logic */ }) {
                        Image(systemName: "arrow.up.arrow.down")
                            .foregroundColor(Color("AccentDark"))
                    }
                    Button(action: { showFilterSheet = true }) {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .foregroundColor(Color("AccentDark"))
                    }
                }
            )
            .sheet(isPresented: $showFilterSheet) {
                FilterView()
            }
        }
    }
}


struct OpportunitiesView_Previews: PreviewProvider {
    static var previews: some View {
        OpportunitiesView()
    }
}
