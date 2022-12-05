//
//  CarouselView.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 5/12/22.
//

import SwiftUI
import ACarousel

struct Item: Identifiable {
    let id = UUID()
    let image: Image
}

let roles = ["LaunchImage", "LogoWithoutText"]

struct CarouselView: View {
    let items: [Item] = roles.map { Item(image: Image($0)) }
    
        
        var body: some View {
            ACarousel(items) { item in
                item.image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150)
                    .cornerRadius(30)
            }
            .frame(height: 300)
        }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
