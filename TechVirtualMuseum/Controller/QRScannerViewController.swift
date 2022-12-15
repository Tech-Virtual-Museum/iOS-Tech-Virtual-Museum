//
//  QRScannerViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 1/12/22.
//

import UIKit
import SwiftUI
import AVFoundation


/*
class QRScannerViewController: UIHostingController<QRScannerView> {
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder, rootView: QRScannerView())
    }
 */

class QRScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    var firestoreService = FirestoreService()
    
    var itemDetails: [String: Any] = [:]

    var captureSession: AVCaptureSession!
        var previewLayer: AVCaptureVideoPreviewLayer!

        override func viewDidLoad() {
            super.viewDidLoad()

            view.backgroundColor = UIColor.black
            captureSession = AVCaptureSession()

            guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
            let videoInput: AVCaptureDeviceInput

            do {
                videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
            } catch {
                return
            }

            if (captureSession.canAddInput(videoInput)) {
                captureSession.addInput(videoInput)
            } else {
                failed()
                return
            }

            let metadataOutput = AVCaptureMetadataOutput()

            if (captureSession.canAddOutput(metadataOutput)) {
                captureSession.addOutput(metadataOutput)

                metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                metadataOutput.metadataObjectTypes = [.qr]
            } else {
                failed()
                return
            }

            previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.frame = view.layer.bounds
            previewLayer.videoGravity = .resizeAspectFill
            view.layer.addSublayer(previewLayer)

            captureSession.startRunning()
        }

        func failed() {
            let ac = UIAlertController(title: "Scanning not supported", message: "Your device does not support scanning a code from an item. Please use a device with a camera.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
            captureSession = nil
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            if (captureSession?.isRunning == false) {
                captureSession.startRunning()
            }
        }

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)

            if (captureSession?.isRunning == true) {
                captureSession.stopRunning()
            }
        }

        func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
            captureSession.stopRunning()

            if let metadataObject = metadataObjects.first {
                guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
                guard let stringValue = readableObject.stringValue else { return }
                AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
                found(code: stringValue)
                return
            }

            dismiss(animated: true)
        }

        func found(code: String) {
            print(code)
            //dismiss(animated: true)
            self.firestoreService.getDocumentWithDocumentId(collectionId: "products", documentId: code) {
                (error, documentData) in
                self.itemDetails = documentData
                self.performSegue(withIdentifier: "showProductDetails", sender: self)
            }
            
            
        }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showProductDetails" {
                // get a reference to the destination view controller
                let destinationVC = segue.destination as! ProductDetailsViewController

                // set the itemDetails property of the destination view controller to the itemDetails property of the current view controller
                destinationVC.itemDetails = self.itemDetails
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
