//
//  EditAccountDataViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 21/12/22.
//

import UIKit

class EditAccountDataViewController: UIViewController {
    var accountData: AccountData? = nil
    
    let firestoreService = FirestoreService()
    let firebaseAuthService = FirebaseAuthService()
    
    @IBOutlet weak var nameTxtFld: UITextField!
    @IBOutlet weak var surnameTxtFld: UITextField!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    @IBOutlet weak var repeatPasswordTxtFld: UITextField!
    
    var originalName: String = ""
    var originalSurname: String = ""
    var originalEmail: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTxtFld.text = accountData?.name
        surnameTxtFld.text = accountData?.surname
        emailTxtFld.text = accountData?.email
        
        originalName = accountData!.name
        originalSurname = accountData!.surname
        originalEmail = accountData!.email
        
        
        
        /*
        nameTxtFld.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        surnameTxtFld.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTxtFld.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTxtFld.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        repeatPasswordTxtFld.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
         */
        
    }
    
    
    @IBAction func saveBtnTouched(_ sender: Any) {
        if nameTxtFld.text != self.originalName || surnameTxtFld.text != self.originalSurname || emailTxtFld.text != self.originalEmail {
            if emailTxtFld.text == originalEmail {
                let dict: [String: Any] = ["name": nameTxtFld.text, "surname": surnameTxtFld.text, "email": originalEmail]
                self.firestoreService.setDocumentWithDocumentId(collectionId: "users", documentId: accountData!.id, documentData: dict) {
                    error in
                    if (error) {
                        let alertController = UIAlertController(title: "Error", message: "There has been an error when changing your account data.", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alertController, animated: false)
                        
                    }
                    else {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let homeViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                        homeViewController.modalPresentationStyle = .fullScreen
                        self.parent?.present(homeViewController, animated: true, completion: nil)
                    }
                }
            }
            else {
                self.firebaseAuthService.changeEmail(email: emailTxtFld.text!) { [self]
                    (error, description) in
                    if (error) {
                        let alertController = UIAlertController(title: "Error", message: description, preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alertController, animated: false)
                    }
                    else if (!error) {
                        let dict: [String: Any] = ["name": self.nameTxtFld.text, "surname": self.surnameTxtFld.text, "email": self.emailTxtFld.text]
                        self.firestoreService.setDocumentWithDocumentId(collectionId: "users", documentId: accountData!.id, documentData: dict) {
                            error in
                            if (error) {
                                let alertController = UIAlertController(title: "Error", message: "There has been an error when changing your account data.", preferredStyle: .alert)
                                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                self.present(alertController, animated: false)
                                
                            }
                            else {
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let homeViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                                homeViewController.modalPresentationStyle = .fullScreen
                                self.parent?.present(homeViewController, animated: true, completion: nil)
                            }
                        }
                    }
                }
                
            }
        }
        
        if passwordTxtFld.text != "" {
            if passwordTxtFld.text == repeatPasswordTxtFld.text {
                self.firebaseAuthService.changePassword(password: passwordTxtFld.text!) {
                    (error, description) in
                    if (error) {
                        let alertController = UIAlertController(title: "Error", message: description, preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                        self.present(alertController, animated: false)
                    }
                    else {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let homeViewController = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                        homeViewController.modalPresentationStyle = .fullScreen
                        self.parent?.present(homeViewController, animated: true, completion: nil)
                    }
                }
            }
            else {
                let alertController = UIAlertController(title: "Error", message: "The password/change password fields do not match.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertController, animated: false)
            }
        }
    }
    
    
    /*
    @objc func textFieldDidChange(_ textField: UITextField) {
        if textField == nameTxtFld || textField == surnameTxtFld {
            print("Entra")
        }
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
