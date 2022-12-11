//
//  EventViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 29/11/22.
//

import UIKit
import FirebaseFirestore


class EventViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
    

    var firestoreService = FirestoreService()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var items: [[String: Any]] = []
    var data: [String] = []
    
    var filteredItems: [[String: Any]] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        self.firestoreService.getCollection(collectionId: "eventos") {
            (error, collectionData) in
            for document in collectionData {
                //print("\(document.documentID) => \(document.data())")
                self.items.append(document.data())
            }
            self.filteredItems = self.items
            self.tableView.reloadData()
        }
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let tableViewTopConstraint = tableView.topAnchor.constraint(equalTo: view.topAnchor)
        tableViewTopConstraint.constant = +160
        
        let tableViewLeadingConstraint = tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        NSLayoutConstraint.activate([
            tableViewTopConstraint,
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableViewLeadingConstraint,
        ])

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(CustomNewCell.self, forCellReuseIdentifier: "Cell")
        
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
        
        return 90 + 2 * 5
    }
    
    func tableView(_ tableView: UITableView, widthForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return filteredItems.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layer.cornerRadius = 20
        cell.preservesSuperviewLayoutMargins = false
        cell.layer.borderWidth = 0
        cell.layer.borderColor = UIColor.white.cgColor
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Create an instance of the view controller you want to navigate to
            let vc = EventDetailsViewController()
            
            // Set any properties on the view controller that you want to pass
            // along to the next view controller
            vc.selectedItem = items[indexPath.row]
            
            // Use the navigation controller to push the view controller onto the stack
            navigationController?.pushViewController(vc, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredItems = searchText.isEmpty ? items : items.filter { (item: [String: Any]) -> Bool in
                // Extract the "name" property from the item dictionary
                let itemName = item["name"] as! String
                // If itemName matches the searchText, return true to include it
            return itemName.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
        tableView.reloadData()
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
