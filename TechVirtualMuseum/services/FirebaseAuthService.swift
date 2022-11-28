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

class FirebaseAuthService {
    let firestoreService = FirestoreService()

    func createUser(name: String, surname: String, email: String, password: String, completionBlock: @escaping (_ success: Bool, _ error: String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let user = authResult?.user {
                let userData = ["name": name,
                                "surname": surname,
                                "email": email
                                ]

                self.firestoreService.addDocumentDataWithDocumentId(collectionId: "users", documentId: user.uid, data: userData)
                //Firestore.firestore().collection("users").document(user.uid).setData(userData)
                completionBlock(true, "")
            } else {
                completionBlock(false, error?.localizedDescription ?? "")
            }
        }
    }
    
    func signIn(email: String, password: String, completionBlock: @escaping (_ success: Bool,  _ error: String) -> Void){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completionBlock(false, error.localizedDescription ?? "")
            } else {
                completionBlock(true, "")
            }
        }
    }
    
    func getCurrentUserId(completion: @escaping (_ loggedIn: Bool, _ id: String) -> Void) {
        if Auth.auth().currentUser != nil {
            completion(true, Auth.auth().currentUser!.uid)
        } else {
            completion(false, "")
        }
    }
    
    func signOut(completion: @escaping (_ error: Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch {
            completion(false)
        }
    }
}
