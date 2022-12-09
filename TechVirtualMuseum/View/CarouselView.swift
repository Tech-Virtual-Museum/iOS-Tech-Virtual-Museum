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

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}

func updateNumber() {
    return
}

let roles = ["slider1", "slider2", "slider3"]

struct CarouselView: View {
    @State private var currentPage = 0
    
    let items: [Item] = roles.map { Item(image: Image($0)) }
    
        
        var body: some View {
            ZStack(alignment: .centerLastTextBaseline) {
                ACarousel(items,
                          index: $currentPage,
                          spacing: 60,
                          headspace: 10,
                          sidesScaling: 0.7,
                          isWrap: true,
                          autoScroll: .active(8)
                        ) { item in
                
                    item.image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150)
                        .cornerRadius(30)
                        
                }
                .frame(height: 210)
                PageControl(numberOfPages: roles.count, currentPage: $currentPage)
                            .frame(width: CGFloat(roles.count * 10))
                            .padding(.trailing)
                            .colorInvert()
                            .frame(height: CGFloat(0.5))
                    }
        }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
