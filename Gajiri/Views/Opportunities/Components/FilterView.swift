//
//  FilterView.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//
import SwiftUI


struct FilterView: View {
    @State private var selectedLocation = ""
    @State private var selectedJobType = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Location")) {
                    Picker("Select Location", selection: $selectedLocation) {
                        Text("All").tag("")
                        Text("Remote").tag("Remote")
                        Text("On-site").tag("On-site")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Job Type")) {
                    Picker("Select Job Type", selection: $selectedJobType) {
                        Text("All").tag("")
                        Text("Full-time").tag("Full-time")
                        Text("Part-time").tag("Part-time")
                        Text("Contract").tag("Contract")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationTitle("Filter Opportunities")
            .navigationBarItems(
                trailing: Button("Apply") {
                    // Apply filter logic
                }
            )
        }
    }
}


struct FilterSectionView: View {
    @Binding var selectedJobTypes: Set<String>
    @Binding var selectedLocations: Set<String>
    @Binding var sortOption: String
    
    let jobTypes = ["Full-time", "Part-time", "Remote", "Hybrid"]
    let locations = ["Remote", "San Francisco", "New York", "Austin"]
    let sortOptions = ["Most Recent", "Highest Salary", "Location"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Filters")
                .font(.headline)
            
            // Job Type Filters
            HStack {
                Text("Job Type:")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(jobTypes, id: \.self) { type in
                            FilterChipView(
                                text: type,
                                isSelected: selectedJobTypes.contains(type)
                            ) {
                                if selectedJobTypes.contains(type) {
                                    selectedJobTypes.remove(type)
                                } else {
                                    selectedJobTypes.insert(type)
                                }
                            }
                        }
                    }
                }
            }
            
            // Sort Picker
            Picker("Sort By", selection: $sortOption) {
                ForEach(sortOptions, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
}

struct FilterChipView: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(20)
        }
    }
}
