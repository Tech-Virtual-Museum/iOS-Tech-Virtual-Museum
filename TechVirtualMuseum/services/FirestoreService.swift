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
    
    func addDocumentDataWithDocumentId(collectionId: String, documentId: String, data: [String : Any]) {
        Firestore.firestore().collection(collectionId).document(documentId).setData(data)
    }
}
