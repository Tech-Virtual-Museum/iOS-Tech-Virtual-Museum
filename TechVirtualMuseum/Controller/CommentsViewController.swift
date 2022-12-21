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
    var comments: [[String: Any]] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func sendCommentBtnTapped(_ sender: UIButton) {
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
