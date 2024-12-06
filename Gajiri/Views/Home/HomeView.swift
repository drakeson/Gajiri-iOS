//
//  HomeView.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//

import SwiftUI


struct HomeView: View {
    // User name state
    @State private var userName = "John Doe"
    
    // Search query state
    @State private var searchQuery = ""
    
    // Services collection (expanded to 9 items)
    private let services: [ServiceItem] = [
        ServiceItem(title: "Design", systemImageName: "paintbrush.fill"),
        ServiceItem(title: "Development", systemImageName: "desktopcomputer"),
        ServiceItem(title: "Marketing", systemImageName: "megaphone.fill"),
        ServiceItem(title: "Writing", systemImageName: "pencil.and.outline"),
        ServiceItem(title: "Photography", systemImageName: "camera.fill"),
        ServiceItem(title: "Consulting", systemImageName: "lightbulb.fill"),
        ServiceItem(title: "Translation", systemImageName: "globe"),
        ServiceItem(title: "Video Editing", systemImageName: "film.fill"),
        ServiceItem(title: "Music", systemImageName: "music.note")
    ]
    
    // Grid layout
    private let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Greeting Header
                    HStack {
                        Text("Welcome, \(userName)!")
                            .font(.system(size: 24, weight: .bold))
                            .padding(.horizontal)
                        
                        Spacer() // Pushes the image to the right
                        
                        Image("icon_ten") // Replace with your image
                            .resizable()
                            .padding(9.0)
                            .scaledToFit()
                            .frame(width: 58, height: 58)
                    }
                    .padding(.horizontal, 3.0)
                    
                    // Search Bar
                    SearchBar(text: $searchQuery)
                        .padding(.vertical, 1.0)
                    
                    
                    // Services Grid
                    VStack(alignment: .leading) {
                        Text("Our Services")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: gridLayout, spacing: 15) {
                            ForEach(services) { service in
                                ServiceCard(service: service)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 5.0)
                    
                    // Promotional Banner
                    PromotionalBanner()
                        .padding(.top, 10.0)
                }
                .padding(.vertical)
            }
            .navigationBarHidden(true)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
