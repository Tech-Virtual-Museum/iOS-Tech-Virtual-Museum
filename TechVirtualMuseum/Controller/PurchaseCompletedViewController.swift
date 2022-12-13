//
//  PurchaseCompletedViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 13/12/22.
//

import UIKit

class PurchaseCompletedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.performSegue(withIdentifier:"return",sender: self)
        DispatchQueue.main.asyncAfter(deadline:.now() + 1.0, execute: {
           self.performSegue(withIdentifier:"return",sender: self)

        })

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
