//
//  ResetPasswordViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 20/12/22.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    var firebaseAuthService = FirebaseAuthService()
    
    @IBOutlet weak var emailTxtFld: UITextField!
    
    @IBAction func sendReset(_ sender: UIButton) {
        firebaseAuthService.sendPasswordReset(email: emailTxtFld.text ?? "") {
            (error, errorDescription) in
            if (error == false) {
                let alertController = UIAlertController(title: "Success!", message: "Check your email inbox for the password recovery mail.", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                }
                alertController.addAction(cancelAction)
                self.present(alertController, animated: true) {
                }
            }
            else {
                let alertController = UIAlertController(title: "An error has ocurred.", message: errorDescription, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
                }
                alertController.addAction(cancelAction)
                self.present(alertController, animated: true) {
                }
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
