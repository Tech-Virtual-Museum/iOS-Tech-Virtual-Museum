//
//  SignUpViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 27/11/22.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    var signUpManager = FirebaseAuthService()
    
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSurname: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRepeatPassword: UITextField!
    
    var keyboardSize: CGRect? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        txtEmail.delegate = self
        txtPassword.delegate = self
        txtRepeatPassword.delegate = self

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
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Shift the view up by the height of the keyboard
        view.frame.origin.y = -keyboardSize!.height + 100
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Shift the view back down to its original position
        view.frame.origin.y = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Register for keyboard notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Unregister for keyboard notifications
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // Update the height of the view to shift it up by the height of the keyboard
            //view.frame.origin.y = -keyboardSize.height
            self.keyboardSize = keyboardSize
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        // Shift the view back down to its original position
        view.frame.origin.y = 0
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
