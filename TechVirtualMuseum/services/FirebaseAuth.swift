//
//  FirebaseAuth.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 27/11/22.
//

import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import UIKit

class FirebaseAuth {

    func createUser(name: String, surname: String, email: String, password: String, completionBlock: @escaping (_ success: Bool, _ error: String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let user = authResult?.user {
                completionBlock(true, "")
            } else {
                completionBlock(false, error?.localizedDescription ?? "")
            }
        }
    }
    
    func signIn(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void){
        Auth.auth().signIn(withEmail: email, password: password)
    }

}
