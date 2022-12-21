//
//  HomeViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 28/11/22.
//

import UIKit
import MapKit
//import HSCycleGalleryView

class HomeViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var carousel: UIView!
    
    var firestoreService = FirestoreService()
    var items: [UIViewController] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = nil
        setMapAnnotation(latitude: 28.073088, longitude: -15.451391)
        setMapRegion(latitude: 28.073088, longitude: -15.451391)
        map.delegate = self
    }
    
    
    func setMapAnnotation(latitude: Double, longitude: Double) {
        let mkAnnotation: MKPointAnnotation = MKPointAnnotation()
        mkAnnotation.coordinate =  CLLocationCoordinate2DMake(latitude, longitude)
        mkAnnotation.title = "Tech Virtual Museum"
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
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let latitude = (view.annotation?.coordinate.latitude)!
        let longitude = (view.annotation?.coordinate.longitude)!

        let regionDistance: CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = view.annotation?.title ?? "TVM Location"
        mapItem.openInMaps(launchOptions: options)
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
