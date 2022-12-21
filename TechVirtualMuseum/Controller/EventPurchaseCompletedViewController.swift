//
//  EventPurchaseCompletedViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 21/12/22.
//

import UIKit

class EventPurchaseCompletedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func okBtnTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let eventViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
        eventViewController.index = 0
        eventViewController.modalPresentationStyle = .fullScreen
        self.present(eventViewController, animated: true, completion: nil)
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
