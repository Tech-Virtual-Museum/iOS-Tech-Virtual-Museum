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
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    let layout = UICollectionViewFlowLayout()
    
    let hours: [String] = ["10:00 AM", "11:00 AM", "12:00 PM", "1:00 PM", "2:00 PM",
                           "3:00 PM", "4:00 PM", "5:00 PM", "6:00 PM", "7:00 PM",
                           "8:00 PM", "9:00 PM"]
    
    let dateFormatter = DateFormatter()
    
    var lastSelectedCell: UICollectionViewCell? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "dd/MM/yyyy"
        datePicker.minimumDate = Date()
        let selectedDate = datePicker.date
        datePicker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
        
        hourCollectionView.register(CustomHourCell.self, forCellWithReuseIdentifier: "CustomHourCell")
        
        
        hourCollectionView.dataSource = self
        hourCollectionView.delegate = self
        
        
        
        layout.itemSize = CGSize(width: 90, height: 50)
        //layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        
        hourCollectionView.setCollectionViewLayout(layout, animated: false)
        hourCollectionView.showsVerticalScrollIndicator = false
        hourCollectionView.showsHorizontalScrollIndicator = false
    }
    
   


    @objc func datePickerChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        var dateString = ""
        if Calendar.current.isDateInToday(selectedDate)  {
            dateString = "TODAY"
        } else {
            dateString = dateFormatter.string(from: selectedDate)
        }
        
        dateLbl.text = dateString

        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomHourCell", for: indexPath) as! CustomHourCell
            // Configure the cell with data from your data source
           
            cell.layer.borderColor = UIColor(named: "ButtonBackground")?.cgColor
            cell.layer.borderWidth = 2
            cell.layer.cornerRadius = 10
            //cell.hourLbl?.text = hours[indexPath.item]
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            // Return the number of items in the collection view
        return hours.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        lastSelectedCell?.backgroundColor = UIColor(named: "white")
        let cell = collectionView.cellForItem(at: indexPath)
        lastSelectedCell = cell
        cell?.backgroundColor = UIColor(named: "ButtonBackgroundLight")
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
