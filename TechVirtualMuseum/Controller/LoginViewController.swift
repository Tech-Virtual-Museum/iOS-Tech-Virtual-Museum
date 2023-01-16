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
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        loginManager.getCurrentUserId() {
            loggedIn, id in
            if (loggedIn) {
                print("A")
                let homeViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                homeViewController.modalPresentationStyle = .fullScreen
                self.parent?.present(homeViewController, animated: false, completion: nil)
            }
            
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func processLogin(_ sender: Any) {
        guard let email = txtEmail.text, let password = txtPassword.text else { return }
        loginManager.signIn(email: email, password: password) {[weak self] (success, error) in
                guard let `self` = self else { return }
                var message: String = ""
                if (success) {
                    message = "User was sucessfully logged in."
                    //self.performSegue(withIdentifier: "home", sender: self)
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    let homeViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                    //self.present(homeViewController, animated: true, completion: nil)
                    //self.navigationController?.pushViewController(homeViewController, animated: true)
                    homeViewController.modalPresentationStyle = .fullScreen
                    self.parent?.present(homeViewController, animated: true, completion: nil)
                } else {
                    message = "There was an error. " + error
                    let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertController, animated: false)
                }
                
            }
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

    /*
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "home" {
            var message: String = ""
            var successRes: Bool = true
            guard let email = txtEmail.text, let password = txtPassword.text else { return false }
            let result: () = loginManager.signIn(email: email, password: password) {
                [weak self] (success, error) in
                if (success) {
                    successRes = true
                    
                } else {
                    successRes = false
                    message = "There was an error. "
                    message += error
                    let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self!.present(alertController, animated: false)
                }
                
            }
        }
        return true
    }
     */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
