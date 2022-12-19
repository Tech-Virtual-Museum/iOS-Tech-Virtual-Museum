//
//  SecondSlidePurchaseViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 13/12/22.
//

import UIKit

class SecondSlidePurchaseViewController: UIViewController {
    
    @IBOutlet weak var juniorStepper: UIStepper!
    @IBOutlet weak var studentStepper: UIStepper!
    @IBOutlet weak var adultStepper: UIStepper!
    @IBOutlet weak var seniorStepper: UIStepper!
    
    @IBOutlet weak var juniorQuantity: UILabel!
    @IBOutlet weak var studentQuantity: UILabel!
    @IBOutlet weak var adultQuantity: UILabel!
    @IBOutlet weak var seniorQuantity: UILabel!
    
    
    @IBOutlet weak var juniorOrderLbl: UILabel!
    @IBOutlet weak var studentOrderLbl: UILabel!
    @IBOutlet weak var adultOrderLbl: UILabel!
    @IBOutlet weak var seniorOrderLbl: UILabel!
    
    @IBOutlet weak var totalLbl: UILabel!
    
    @IBAction func tapBuyButton(_ sender: UIButton) {
    }
    
    
    var total: Double = 0
    var dialogMessage = UIAlertController(title: "No tickets selected", message: "You haven't selected any tickets yet. Add a ticket to continue.", preferredStyle: .alert)
    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
         print("Ok button tapped")
      })
    
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
            // Use a switch statement to update the correct label for the stepper that was changed
            
            
            switch sender.tag {
                
            case 1:
                juniorQuantity.text = "\(Int(sender.value))"
                juniorOrderLbl.text = "\(Int(sender.value))"
                
            case 2:
                studentQuantity.text = "\(Int(sender.value))"
                studentOrderLbl.text = "\(Int(sender.value))"
                
            case 3:
                adultQuantity.text = "\(Int(sender.value))"
                adultOrderLbl.text = "\(Int(sender.value))"
                
            case 4:
                seniorQuantity.text = "\(Int(sender.value))"
                seniorOrderLbl.text = "\(Int(sender.value))"
           
            default:
                
                break
            }
        total = juniorStepper.value * 2.5 +  studentStepper.value * 4.5 + adultStepper.value * 7.0 + seniorStepper.value * 4.5
        let totalString = String(format: "%.2f", total)
        totalLbl.text = "€\(totalString)"
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dialogMessage.addAction(ok)
        juniorStepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        studentStepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        adultStepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        seniorStepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)

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
