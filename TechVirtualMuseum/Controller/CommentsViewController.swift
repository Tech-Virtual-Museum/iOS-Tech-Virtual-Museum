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
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        /*
        self.firestoreService.getDocumentWithDocumentId(collectionId: "comments", documentId: selectedItem ){
            (error, collectionData) in
            self.comments = collectionData["comments"]
            print(self.comments)
        }*/
        
        self.firestoreService.getCollection(collectionId: "comments/BVMroFz8RbG4zpjI3b71/comments") {
            (error, collectionData) in
            for document in collectionData {
                print("\(document.documentID) => \(document.data())")
                //self.items.append(document.data())
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
