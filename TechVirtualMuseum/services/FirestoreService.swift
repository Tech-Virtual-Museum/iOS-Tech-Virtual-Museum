//
//  Firestore.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 28/11/22.
//

import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import UIKit

class FirestoreService {
    
    var db = Firestore.firestore()

    func addDocumentDataWithDocumentId(collectionId: String, documentId: String, data: [String : Any]) {
        Firestore.firestore().collection(collectionId).document(documentId).setData(data)
    }
    
    func getDocumentWithDocumentId(collectionId: String, documentId: String, completion: @escaping (_ error: Bool, _ docData: [String: Any]) -> Void) {
        let docRef = db.collection(collectionId).document(documentId)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()
                completion(false, dataDescription ?? ["": ""])
                
            } else {
                completion(true, ["": ""])
            }
        }
    }
    
    func getCollection(collectionId: String, completion: @escaping (_ error: Bool, _ docData: [QueryDocumentSnapshot]) -> Void) {
        db.collection(collectionId).getDocuments() { (querySnapshot, err) in
            if (err != nil)  {
                    completion(true, [])
                } else {
                    completion(false, querySnapshot!.documents)
                }
        }

    }
}
