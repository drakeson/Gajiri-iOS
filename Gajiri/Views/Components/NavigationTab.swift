//
//  NavigationTab.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//

enum NavigationTab {
    case home
    case opportunities
    case profile
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .opportunities: return "Opportunities"
        case .profile: return "Profile"
        }
    }
    
    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .opportunities: return "briefcase.fill"
        case .profile: return "person.fill"
        }
    }
}
