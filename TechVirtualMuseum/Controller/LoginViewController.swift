//
//  LoginViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 27/11/22.
//

import UIKit

class LoginViewController: UIViewController {
    var loginManager = FirebaseAuthService()
    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func processLogin(_ sender: Any) {
        guard let email = txtEmail.text, let password = txtPassword.text else { return }
        loginManager.signIn(email: email, password: password) {[weak self] (success, error) in
                guard let `self` = self else { return }
                var message: String = ""
                if (success) {
                    message = "User was sucessfully logged in."
                    self.performSegue(withIdentifier: "home", sender: self)
                } else {
                    message = "There was an error. " + error
                }
                print(message)
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertController, animated: false)
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
