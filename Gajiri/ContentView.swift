//
//  ContentView.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: NavigationTab = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .navigationBarHidden(true)
                .tabItem {
                    Label(NavigationTab.home.title,
                          systemImage: NavigationTab.home.icon)
                }
                .tag(NavigationTab.home)
            
            OpportunitiesView()
                .navigationBarHidden(true)
                .tabItem {
                    Label(NavigationTab.opportunities.title,
                          systemImage: NavigationTab.opportunities.icon)
                }
                .tag(NavigationTab.opportunities)
            
            ProfileView()
                .navigationBarHidden(true)
                .tabItem {
                    Label(NavigationTab.profile.title,
                          systemImage: NavigationTab.profile.icon)
                }
                .tag(NavigationTab.profile)
        }
        .tint(.accentColor) // Customize active tab color
        .onAppear {
            // Customize tab bar appearance
            let appearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()
            
            // Customize normal state
            let normalAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 12, weight: .regular)
            ]
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
            
            // Customize selected state
            let selectedAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 12, weight: .medium)
            ]
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
            
            UITabBar.appearance().standardAppearance = appearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
    }
}

#Preview {
    ContentView()
}
