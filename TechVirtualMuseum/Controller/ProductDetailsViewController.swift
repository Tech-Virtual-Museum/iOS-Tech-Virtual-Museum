//
//  ProductDetailsViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 12/12/22.
//

import UIKit
import SDWebImage

class ProductDetailsViewController: UIViewController {
    
    var itemDetails: [String: Any]?
    var firestoreService = FirestoreService()
    
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    
    @IBOutlet weak var commentNumberLbl: UILabel!
    var selectedItem: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionId = "comments/" + self.selectedItem + "/comments"
        firestoreService.collectionSize(collectionId: collectionId) {
            (error, count) in
            if (!error) {
                let countString = String(count)
                self.commentNumberLbl.text = countString + " comments"
            }
        }

        itemImage.contentMode = .scaleAspectFill
        if let url = URL(string: itemDetails?["img"] as! String) {
            itemImage.sd_setImage(with: url)
        }
        itemName.text = itemDetails?["name"] as? String
        itemDescription.text = itemDetails?["descripcion"] as? String
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showProductVideo" {
            let destinationVC = segue.destination as! VideoViewController
            destinationVC.videoId = self.itemDetails?["videoId"] as! String
        }
        
        if segue.identifier == "showProductComments" {
            let destinationVC = segue.destination as! CommentsViewController
            destinationVC.selectedItem = self.selectedItem
        }
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
