//
//  JobTagView.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//

import SwiftUI

struct JobTagView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(4)
            .background(Color.blue.opacity(0.1))
            .cornerRadius(4)
    }
}
