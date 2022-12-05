//
//  CarouselViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 5/12/22.
//

import UIKit
import SwiftUI


class CarouselViewController: UIHostingController<CarouselView> {
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder, rootView: CarouselView())
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
