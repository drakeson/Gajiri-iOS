//
//  PromotionalBanner.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//

import SwiftUI

struct PromotionalBanner: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("New Update Available!")
                    .font(.headline)
                
                Text("Check out our latest features")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button(action: {
                // Handle update action
            }) {
                Text("Update")
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color("AccentColor"))
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color("AccentColor").opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
