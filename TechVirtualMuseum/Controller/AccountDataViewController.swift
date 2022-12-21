//
//  AccountDataViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 28/11/22.
//

import UIKit

class AccountDataViewController: UIViewController {
    
    @IBOutlet weak var txtNameDisplay: UITextField!
    @IBOutlet weak var txtSurnameDisplay: UITextField!
    @IBOutlet weak var txtEmailDisplay: UITextField!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var fireAuthService = FirebaseAuthService()
    var firestoreService = FirestoreService()
    var accountData: AccountData? = nil


    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.startAnimating()
        self.fireAuthService.getCurrentUserId() {
            (loggedIn, id) in
            if loggedIn {
                var userId: String = id
                let userInfo = self.firestoreService.getDocumentWithDocumentId(collectionId: "users", documentId: id) {
                    (error, docData) in
                    print(docData)
                    var userName: String = ""
                    var userSurname: String = ""
                    var userEmail: String = ""
                    
                    
                    if let name = docData["name"] as? String {
                        self.txtNameDisplay.text = name
                        userName = name
                    }
                    if let surname = docData["surname"] as? String {
                        self.txtSurnameDisplay.text = surname
                        userSurname = surname
                    }
                    if let email = docData["email"] as? String {
                        self.txtEmailDisplay.text = email
                        userEmail = email
                    }
                    self.accountData = AccountData(id: userId, name: userName, surname: userSurname, email: userEmail)
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.removeFromSuperview()
                    
                }
                
            }
            
        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tapLogOutButton(_ sender: Any) {
        self.fireAuthService.signOut() {
            (error) in
            var message: String = ""
            if error {
                message = "There was a problem logging out."
            } else {
                self.performSegue(withIdentifier: "login", sender: self)
            }
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: false)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editData" {
            let destinationVC = segue.destination as! EditAccountDataViewController
            destinationVC.accountData = self.accountData
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
