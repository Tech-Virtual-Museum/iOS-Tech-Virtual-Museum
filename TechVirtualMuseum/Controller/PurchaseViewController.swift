//
//  PurchaseViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 12/12/22.
//

import UIKit

class PurchaseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var hourCollectionView: UICollectionView!
    @IBOutlet weak var juniorStepperLbl: UILabel!
    @IBOutlet weak var studentStepperLbl: UILabel!
    @IBOutlet weak var adultStepperLbl: UILabel!
    @IBOutlet weak var seniorStepperLbl: UILabel!
    @IBOutlet weak var juniorOrderLbl: UILabel!
    @IBOutlet weak var studentOrderLbl: UILabel!
    @IBOutlet weak var adultOrderLbl: UILabel!
    @IBOutlet weak var seniorOrderLbl: UILabel!
    @IBOutlet weak var studentStepper: UIStepper!
    @IBOutlet weak var adultStepper: UIStepper!
    @IBOutlet weak var seniorStepper: UIStepper!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var juniorStepper: UIStepper!
    
    let layout = UICollectionViewFlowLayout()
    
    let hours: [String] = ["10:00 AM", "11:00 AM", "12:00 PM", "1:00 PM", "2:00 PM",
                           "3:00 PM", "4:00 PM", "5:00 PM", "6:00 PM", "7:00 PM",
                           "8:00 PM", "9:00 PM"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hourCollectionView.dataSource = self
        hourCollectionView.delegate = self
        
        hourCollectionView.register(CustomHourCell.self, forCellWithReuseIdentifier: "MyCell")
        
        layout.itemSize = CGSize(width: 90, height: 50)
        //layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        
        hourCollectionView.setCollectionViewLayout(layout, animated: false)
        hourCollectionView.showsVerticalScrollIndicator = false
        hourCollectionView.showsHorizontalScrollIndicator = false

        //juniorStepper.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CustomHourCell
            // Configure the cell with data from your data source
            cell.hourLbl?.text = "a"
            cell.layer.backgroundColor = UIColor.black.cgColor
            cell.layer.cornerRadius = 10
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            // Return the number of items in the collection view
        return hours.count
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
