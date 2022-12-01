//
//  QRScannerViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 1/12/22.
//

import UIKit
import AVFoundation

class QRScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var lblOutput: UILabel!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // Get an instance of the AVCaptureDevice class to initialize a
            // device object and provide the video as the media type parameter
            guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else {
                fatalError("No video device found")
            }
                                  
            do {
                // Get an instance of the AVCaptureDeviceInput class using the previous deivce object
                let input = try AVCaptureDeviceInput(device: captureDevice)
                       
                // Initialize the captureSession object
                let captureSession = AVCaptureSession()
                       
                // Set the input device on the capture session
                captureSession.addInput(input)
                       
                // Get an instance of ACCapturePhotoOutput class
                let capturePhotoOutput = AVCapturePhotoOutput()
                capturePhotoOutput.isHighResolutionCaptureEnabled = true
                       
                // Set the output on the capture session
                captureSession.addOutput(capturePhotoOutput)
                captureSession.sessionPreset = .high
                       
                // Initialize a AVCaptureMetadataOutput object and set it as the input device
                let captureMetadataOutput = AVCaptureMetadataOutput()
                captureSession.addOutput(captureMetadataOutput)
                       
                // Set delegate and use the default dispatch queue to execute the call back
                captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
                       
                //Initialise the video preview layer and add it as a sublayer to the viewPreview view's layer
                let videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                videoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
                videoPreviewLayer.frame = view.layer.bounds

                //start video capture
                captureSession.startRunning()
                       
            } catch {
                //If any error occurs, simply print it out
                print(error)
                return
            }
            
        }
    
    func metadataOutput(_ captureOutput: AVCaptureMetadataOutput,
                            didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is contains at least one object.
        if metadataObjects.count == 0 {
            return
        }
        
        //self.captureSession?.stopRunning()
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            if let outputString = metadataObj.stringValue {
                DispatchQueue.main.async {
                    print(outputString)
                    self.lblOutput.text = outputString
                }
            }
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
