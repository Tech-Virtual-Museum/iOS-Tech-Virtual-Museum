//
//  HomeViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 28/11/22.
//

import UIKit
import MapKit
import HSCycleGalleryView

class HomeViewController: UIViewController{
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var carousel: UIView!
    
    //let pager = HSCycleGalleryView(frame: CGRect(x:0, y: 0,
                                                 //width: UIScreen.main.bounds.width, height: 200))
    

    var firestoreService = FirestoreService()
    var items: [UIViewController] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //pager.register(cellClass: <#T##AnyClass?#>, forCellReuseIdentifier: "cell")
        /*
        pager.delegate = self
        carousel.addSubview(pager)
        pager.reloadData()
         */
        
        setMapAnnotation(latitude: 28.0731675, longitude: -15.453959)
        setMapRegion(latitude: 28.0731675, longitude: -15.453959)
        self.firestoreService.getDocumentWithDocumentId(collectionId: "slider", documentId: "HXMZGGHpNwx6RJ6w20mV"){
            (error, docData) in
            print(docData)
        }
    }
    
    /*
    func numberOfItemInCycleGalleryView(_ cycleGalleryView: HSCycleGalleryView) -> Int {
        return 3
    }
    
    func cycleGalleryView(_ cycleGalleryView: HSCycleGalleryView, cellForItemAtIndex index: Int) -> UICollectionViewCell {
        let cell = cycleGalleryView.dequeueReusableCell(withIdentifier: "cell",
                                                        for: IndexPath(item: index, section: 0))
        return cell
    }
     */
    
    func setMapAnnotation(latitude: Double, longitude: Double) {
        let mkAnnotation: MKPointAnnotation = MKPointAnnotation()
        mkAnnotation.coordinate =  CLLocationCoordinate2DMake(latitude, longitude)
        map.addAnnotation(mkAnnotation)
    }
    
    func setMapRegion(latitude: Double, longitude: Double) {
        let center = CLLocationCoordinate2D(latitude: latitude,longitude: longitude)
        let mRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        map.setRegion(mRegion, animated: true)
    }
    
    func getSliderImages(completion: @escaping (_ error: Bool, _ docData: [String: Any]) -> Void) {
        self.firestoreService.getDocumentWithDocumentId(collectionId: "slider", documentId: "HXMZGGHpNwx6RJ6w20mV"){
            (error, docData) in
            completion(error, docData)
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
