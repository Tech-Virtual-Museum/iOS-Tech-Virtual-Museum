//
//  PurchaseViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 12/12/22.
//

import UIKit

class PurchaseViewController: UIViewController {
    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
      print("Stepper value changed to: \(sender.value)")
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
