//
//  SearchBar.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search services...", text: $text)
                .foregroundColor(.primary)
        }
        .padding(8)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
