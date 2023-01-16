//
//  InitialViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 16/1/23.
//

import UIKit

class InitialViewController: UIViewController {
    let firebaseAuthService = FirebaseAuthService()

    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        firebaseAuthService.getCurrentUserId() {
            loggedIn, id in
            if (loggedIn) {
                print("A")
                let homeViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                homeViewController.modalPresentationStyle = .fullScreen
                self.parent?.present(homeViewController, animated: true, completion: nil)
            }
            else {
                print("B")
                let homeViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                homeViewController.modalPresentationStyle = .fullScreen
                self.parent?.present(homeViewController, animated: true, completion: nil)
            }
            
        }
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
