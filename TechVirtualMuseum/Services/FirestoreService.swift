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
    
    func setDocumentWithDocumentId(collectionId: String, documentId: String, documentData: [String: Any], completion: @escaping (_ error: Bool) -> Void) {
        let docRef = db.collection(collectionId).document(documentId)

        docRef.setData(documentData) { (error) in
            if (error != nil)  {
                    completion(true)
                } else {
                    completion(false)
                }
        }
    }
    
    func getCollection(collectionId: String, completion: @escaping (_ error: Bool, _ docData: [QueryDocumentSnapshot]) -> Void) {
        db.collection(collectionId).order(by: FieldPath.documentID()).getDocuments() { (querySnapshot, err) in
            if (err != nil)  {
                    completion(true, [])
                } else {
                    completion(false, querySnapshot!.documents)
                }
        }

    }
    
    func addDocumentToCollection(collectionId: String, documentData: [String: Any], completion: @escaping (_ error: Bool) -> Void) {
        let docRef = db.collection(collectionId).addDocument(data: documentData) { (error) in
            if (error != nil)  {
                    completion(true)
                } else {
                    completion(false)
                }
        }
    }
    
    
    func collectionSize(collectionId: String, completion: @escaping (_ error: Bool, _ count: Int) -> Void) {
        let collectionRef = db.collection(collectionId);

        collectionRef.getDocuments { (querySnapshot, error) in
          if let error = error {
              completion(true, 0)
          } else {
            let collectionSize = querySnapshot!.count
            completion(false, collectionSize)
          }
        }
    }
}
