//
//  TabBarController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 9/12/22.
//

import UIKit

class TabBarController: UITabBarController {
    var index: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = index
        
        // Do any additional setup after loading the view.
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
