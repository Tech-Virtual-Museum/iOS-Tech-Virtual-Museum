//
//  PurchaseEventViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 19/12/22.
//

import UIKit

class PurchaseEventViewController: UIViewController {
    
    var fireAuthService = FirebaseAuthService()
    var firestoreService = FirestoreService()
    
    
    @IBOutlet weak var pricingLbl: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperLbl: UILabel!
    @IBOutlet weak var totalTicketsLbl: UILabel!
    @IBOutlet weak var totalPriceLbl: UILabel!
    @IBOutlet weak var pricingSmallerLbl: UILabel!
    
    
    @IBOutlet weak var nameTxtFld: UITextField!
    @IBOutlet weak var surnameTxtFld: UITextField!
    @IBOutlet weak var emailTxtFld: UITextField!
    
    @IBOutlet weak var creditCardBtn: UIButton!
    @IBOutlet weak var paypalBtn: UIButton!
    @IBOutlet weak var applePayBtn: UIButton!
    
    
    var eventPrice: String = "0"
    var lastSelectedButton: UIButton? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pricingLbl.text = (eventPrice as? String ?? "") + "€"
        pricingSmallerLbl.text = "€" + (eventPrice as? String ?? "")
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
        
        creditCardBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        paypalBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        applePayBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    

        self.fireAuthService.getCurrentUserId() {
            (loggedIn, id) in
            if loggedIn {
                let userInfo: () = self.firestoreService.getDocumentWithDocumentId(collectionId: "users", documentId: id) {
                    (error, docData) in
                    print(docData)
                    
                    if let name = docData["name"] as? String {
                        self.nameTxtFld.text = name
                    }
                    if let surname = docData["surname"] as? String {
                        self.surnameTxtFld.text = surname
                    }
                    if let email = docData["email"] as? String {
                        self.emailTxtFld.text = email
                    }
                    
                }
            }
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperLbl.text = "\(Int(sender.value))"
        totalTicketsLbl.text = "\(Int(sender.value))"
        if let doubleValue = Double(eventPrice) {
            let total = sender.value * doubleValue
            let totalString = String(format: "%.2f", total)
            totalPriceLbl.text = "€\(totalString)"
        }
        
       
    }
    
    @objc func buttonTapped(button: UIButton) {
        if (lastSelectedButton != nil) {
            resetButtonStyle(button: lastSelectedButton!)
        }
        lastSelectedButton = button
        button.layer.borderColor = UIColor.red.cgColor
        
        setSelectedButtonStyle(button: button)
    }
    
    func setSelectedButtonStyle(button: UIButton) {
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(named: "ButtonBackground")?.cgColor
        button.layer.cornerRadius = 10
    }
    
    
    func resetButtonStyle(button: UIButton) {
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.systemGray5.cgColor
        button.layer.cornerRadius = 10
    }
    
    
    @IBAction func buyBtnTapped(_ sender: UIButton) {
        if (lastSelectedButton == nil) {
            let alertController = UIAlertController(title: "Error", message: "No payment method selected. Select a payment method to continue.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: false)
        }
        else if (stepper.value == 0) {
            let alertController = UIAlertController(title: "Error", message: "No tickets added. Add a ticket to continue.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: false)
        }
        
        else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let successViewController = storyboard.instantiateViewController(withIdentifier: "PurchaseEventSucceeded")
            successViewController.modalPresentationStyle = .fullScreen
            self.present(successViewController, animated: true, completion: nil)
            
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
