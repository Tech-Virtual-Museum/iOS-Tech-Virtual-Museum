//
//  SignUpViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 27/11/22.
//

import UIKit

class SignUpViewController: UIViewController {
    var signUpManager = FirebaseAuthService()
    
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSurname: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRepeatPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func clickSignUpButton(_ sender: Any) {
        /*
        if let email = txtEmail.text, let password = txtPassword.text, let repeatPassword = txtRepeatPassword.text,
            let name = txtName.text, let surname = txtSurname.text {
                signUpManager.createUser(name: name, surname: surname, email: email, password: password) {[weak self] (success, error) in
                    guard let `self` = self else { return }
                    var message: String = ""
                    if (success) {
                        message = "User was sucessfully created."
                        self.performSegue(withIdentifier: "home", sender: self)
                    } else {
                        message = "There was an error. " + error
                    }
                    let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertController, animated: false)
                }
            }
         */
        if let email = txtEmail.text, let password = txtPassword.text, let repeatPassword = txtRepeatPassword.text,
            let name = txtName.text, let surname = txtSurname.text {
            if password == repeatPassword {
                signUpManager.createUser(name: name, surname: surname, email: email, password: password) {[weak self] (success, error) in
                    guard let `self` = self else { return }
                    if (success) {
                        //self.performSegue(withIdentifier: "home", sender: self)
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        
                        let homeViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                        homeViewController.modalPresentationStyle = .fullScreen
                        self.parent?.present(homeViewController, animated: true, completion: nil)
                    } else {
                        let message = "There was an error. " + error
                        let alertController = UIAlertController(title: "An error ocurred", message: message, preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alertController, animated: false)
                    }
                }
            }
            else {
                let alertController = UIAlertController(title: "An error ocurred", message: "The password/confirm password fields do not match.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertController, animated: false)
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
