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

let roles = ["https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FImage&psig=AOvVaw3p0gSlnw_u2hzsF7UpNe9a&ust=1670361186167000&source=images&cd=vfe&ved=0CA8QjRxqFwoTCKiVvrqy4_sCFQAAAAAdAAAAABAE", "https://d38b044pevnwc9.cloudfront.net/cutout-nuxt/enhancer/2.jpg"]

struct CarouselView: View {
    let items: [Item] = roles.map { Item(image: Image($0)) }
        
        var body: some View {
            ACarousel(items) { item in
                item.image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
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
