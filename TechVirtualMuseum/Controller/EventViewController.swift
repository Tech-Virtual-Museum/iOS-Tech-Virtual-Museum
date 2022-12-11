//
//  EventViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 29/11/22.
//

import UIKit
import FirebaseFirestore


class EventViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var firestoreService = FirestoreService()
    
    @IBOutlet weak var tableView: UITableView!
    
    var items: [[String: Any]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        self.firestoreService.getCollection(collectionId: "eventos") {
            (error, collectionData) in
            for document in collectionData {
                //print("\(document.documentID) => \(document.data())")
                self.items.append(document.data())
            }
            self.tableView.reloadData()
        }
        
        view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            let tableViewTopConstraint = tableView.topAnchor.constraint(equalTo: view.topAnchor)
            tableViewTopConstraint.constant = +150
        
            let tableViewLeadingConstraint = tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            tableViewLeadingConstraint.constant = +10
        
            let tableViewTrailingConstraint = tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            tableViewTrailingConstraint.constant = -10
            NSLayoutConstraint.activate([
              tableViewTopConstraint,
              tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
              tableViewLeadingConstraint,
              //tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              //tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])

            // Set the view controller as the data source and delegate of the table view
            tableView.dataSource = self
            tableView.delegate = self

            // Register a cell class for the table view
            tableView.register(CustomNewCell.self, forCellReuseIdentifier: "Cell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
      }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomNewCell", for: indexPath) as! CustomNewCell
          
          //let imageUrl = items[indexPath.row]["imgUrl"] as? URL
          //print(items[indexPath.row]["name"] as? String)
          
          let item = items[indexPath.row]
          print(item)
          cell.eventTitle?.text = item["name"] as? String
          cell.eventDate?.text = item["date"] as? String
          cell.eventHour?.text = item["hour"] as? String
          if let url = URL(string: item["imgUrl"] as! String) {
              let session = URLSession(configuration: .default)
              let task = session.dataTask(with: url) { (data, response, error) in
                  if error == nil {
                      // Make sure the data is not nil
                      guard let data = data else { return }

                      // Create the image on the main thread
                      DispatchQueue.main.async {
                          cell.eventImage.image = UIImage(data: data)
                      }
                  } else {
                      print("Failed to load the data: \(error!)")
                  }
              }
              task.resume()
          }
        return cell
      }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 115
    }
    
    func tableView(_ tableView: UITableView, widthForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.cornerRadius = 20
        cell.layoutMargins = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
        cell.separatorInset = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
        cell.preservesSuperviewLayoutMargins = false
        cell.layer.borderWidth = 20
        cell.layer.borderColor = UIColor.clear.cgColor
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
