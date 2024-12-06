//
//  ServiceItem.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//

import Foundation

struct ServiceItem: Identifiable {
    let id = UUID()
    let title: String
    let systemImageName: String
}

struct SkillItem: Identifiable {
    let id = UUID()
    let name: String
    let progress: Double
}
