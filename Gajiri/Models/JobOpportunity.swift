//
//  JobOpportunity.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//
import Foundation


struct JobOpportunity: Identifiable {
    let id: String
    let title: String
    let employer: String
    let location: String
    let description: String
    let payEstimate: String
    let tags: [String]
}

struct OpportunityCategory {
    let name: String
    let description: String
    let imageName: String
}
