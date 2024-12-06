//
//  ServiceCard.swift
//  Gajiri
//
//  Created by Kato Drake Smith on 25/11/2024.
//
import SwiftUI

struct ServiceCard: View {
    let service: ServiceItem
    
    var body: some View {
        NavigationLink(destination: OpportunityCategoryDetailsView()) {
            VStack {
                Image(systemName: service.systemImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.accent)
                
                Text(service.title)
                    .font(.caption)
                    .lineLimit(1)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
        }
    }
}
