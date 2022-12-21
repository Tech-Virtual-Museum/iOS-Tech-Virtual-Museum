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
    
    
    var fireAuthService = FirebaseAuthService()
    var firestoreService = FirestoreService()
    
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
                

        
        

        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
