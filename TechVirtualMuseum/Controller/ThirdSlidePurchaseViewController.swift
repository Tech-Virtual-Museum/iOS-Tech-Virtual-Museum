//
//  ThirdSlidePurchaseViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 13/12/22.
//

import UIKit

class ThirdSlidePurchaseViewController: UIViewController {

    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var surnameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    
    
    @IBOutlet weak var creditCardBtn: UIButton!
    @IBOutlet weak var paypalBtn: UIButton!
    @IBOutlet weak var applePayBtn: UIButton!
    
    
    
    var fireAuthService = FirebaseAuthService()
    var firestoreService = FirestoreService()
    var lastSelectedButton: UIButton? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.fireAuthService.getCurrentUserId() {
            (loggedIn, id) in
            if loggedIn {
                let userInfo: () = self.firestoreService.getDocumentWithDocumentId(collectionId: "users", documentId: id) {
                    (error, docData) in
                    print(docData)
                    
                    if let name = docData["name"] as? String {
                        self.nameTxt.text = name
                    }
                    if let surname = docData["surname"] as? String {
                        self.surnameTxt.text = surname
                    }
                    if let email = docData["email"] as? String {
                        self.emailTxt.text = email
                    }
                    
                }
            }
        }
        creditCardBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        paypalBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        applePayBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func buttonTapped(button: UIButton) {
        if (lastSelectedButton != nil) {
            resetButtonStyle(button: lastSelectedButton!)
        }
        lastSelectedButton = button
        button.layer.borderColor = UIColor.red.cgColor
        
        setSelectedButtonStyle(button: button)
    }
    
    func setSelectedButtonStyle(button: UIButton) {
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(named: "ButtonBackground")?.cgColor
        button.layer.cornerRadius = 10
    }
    
    
    func resetButtonStyle(button: UIButton) {
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.layer.cornerRadius = 10
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if identifier == "purchaseSuccessful" {
            if lastSelectedButton != nil {
                return true
            }
            else {
                let alertController = UIAlertController(title: "Select payment method", message: "You must select a payment method to continue.", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertController, animated: false)
                return false
            }
        }
        return true
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
