//
//  EventDetailsViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 11/12/22.
//

import UIKit

class EventDetailsViewController: UIViewController {
    
    var selectedItem: [String: Any]?
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventHour: UILabel!
    @IBOutlet weak var eventPricing: UIButton!
    @IBOutlet weak var eventDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventName.text = selectedItem?["name"] as? String
        eventDate.text = selectedItem?["date"] as? String
        eventHour.text = selectedItem?["hour"] as? String
        eventPricing.configuration?.title = (selectedItem?["pricing"] as? String ?? "") + "€"
        eventDescription.text = selectedItem?["description"] as? String
        if let url = URL(string: selectedItem?["largerImgUrl"] as! String) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    // Make sure the data is not nil
                    guard let data = data else { return }

                    // Create the image on the main thread
                    DispatchQueue.main.async {
                        self.eventImage.image = UIImage(data: data)
                    }
                } else {
                    print("Failed to load the data: \(error!)")
                }
            }
            task.resume()
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
