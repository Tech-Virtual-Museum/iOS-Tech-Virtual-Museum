//
//  CommentsViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 15/12/22.
//

import UIKit

class CommentsViewController: UIViewController {
    
    var selectedItem: String = ""
    let firestoreService = FirestoreService()
    var comments: Any? = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.firestoreService.getDocumentWithDocumentId(collectionId: "comments", documentId: selectedItem ){
            (error, collectionData) in
            self.comments = collectionData["comments"]
            print(self.comments)
        }

        // Do any additional setup after loading the view.
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
