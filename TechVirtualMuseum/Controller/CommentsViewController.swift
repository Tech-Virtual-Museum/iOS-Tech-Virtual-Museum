//
//  CommentsViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 15/12/22.
//

import UIKit

class CommentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var selectedItem: String = ""
    let firestoreService = FirestoreService()
    var fireAuthService = FirebaseAuthService()
    var comments: [[String: Any]] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentTxtFld: UITextField!
    
    
    @IBAction func sendCommentBtnTapped(_ sender: UIButton) {
        if (commentTxtFld.text != "") {
            self.fireAuthService.getCurrentUserId() {
                (loggedIn, id) in
                if loggedIn {
                    var userId: String = id
                    let userInfo = self.firestoreService.getDocumentWithDocumentId(collectionId: "users", documentId: id) {
                        (error, docData) in
                        var userName: String = ""
                        var userSurname: String = ""
                        var userEmail: String = ""
                        if let name = docData["name"] as? String {
                            userName = name
                        }
                        if let surname = docData["surname"] as? String {
                            userSurname = surname
                        }
                        
                        let author = userName + " " + userSurname
                        let collectionId = "comments/" + self.selectedItem + "/comments"
                        self.firestoreService.addDocumentToCollection(collectionId: collectionId, documentData: ["author" : author, "comment": self.commentTxtFld.text]) {
                            error in
                            if (!error) {
                                self.comments.insert(["author" : author, "comment": self.commentTxtFld.text], at: 0)
                                self.commentTxtFld.text = ""
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        let collectionId = "comments/" + selectedItem + "/comments"
        print(collectionId)
        self.firestoreService.getCollection(collectionId: collectionId) {
            (error, collectionData) in
            for document in collectionData {
                print("\(document.documentID) => \(document.data())")
                self.comments.append(document.data())
            }
            self.tableView.reloadData()
        }
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(CustomCommentCell.self, forCellReuseIdentifier: "Cell")

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCommentCell", for: indexPath) as! CustomCommentCell
        
        let comment = comments[indexPath.row]
        
        if let author = comment["author"] as? String {
            cell.commentUsername.text = author
        }
        
        if let author = comment["comment"] as? String {
            cell.commentContent.text = author
        }
        
      return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return comments.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80
    }
  
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Shift the view back down to its original position
        view.frame.origin.y = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Register for keyboard notifications
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Unregister for keyboard notifications
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // Update the height of the view to shift it up by the height of the keyboard
            //view.frame.origin.y = -keyboardSize.height
            view.frame.origin.y = -keyboardSize.height
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        // Shift the view back down to its original position
        view.frame.origin.y = 0
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
