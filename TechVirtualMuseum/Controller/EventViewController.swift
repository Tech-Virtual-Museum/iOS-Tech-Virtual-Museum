//
//  EventViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 29/11/22.
//

import UIKit
import FirebaseFirestore

class EventViewController: UIViewController {
    var firestoreService = FirestoreService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        /*
        let listLayout = listLayout()
        eventList.collectionViewLayout = listLayout
        self.firestoreService.getCollection(collectionId: "eventos") {
            (error, collectionData) in
            for document in collectionData {
                            print("\(document.documentID) => \(document.data())")
                        }
        }
         */
        
        super.viewDidLoad()
        
    }
    
    /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        return cell
    }
    
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
            var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
            listConfiguration.showsSeparators = false
            listConfiguration.backgroundColor = .clear
            return UICollectionViewCompositionalLayout.list(using: listConfiguration)
        }
    
    
    func getEvents(completion: @escaping (_ error: Bool, _ docData: [QueryDocumentSnapshot]) -> Void){
        self.firestoreService.getCollection(collectionId: "eventos") {
            (error, collectionData) in
            print(collectionData)
            completion(error, collectionData)
        }
    }
     */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
