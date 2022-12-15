//
//  VideoViewController.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 15/12/22.
//

import UIKit
import WebKit
import YouTubeiOSPlayerHelper

class VideoViewController: UIViewController, YTPlayerViewDelegate {
    @IBOutlet var videoPlayer: YTPlayerView!

    override func viewDidLoad() {
        self.videoPlayer.delegate = self;
        self.videoPlayer.load(withVideoId: "8PQQZ_nwk6s")
        self.videoPlayer.playVideo()

    }
    
    /*
    override func viewDidLoad() {
           super.viewDidLoad()
           
           // Create an instance of WKWebView
           let webView = WKWebView()
           
           // Set the frame size of the web view
           webView.frame = view.bounds
           
           // Set the content mode of the web view
           webView.contentMode = .scaleAspectFit
           
           // Set the URL of the YouTube video you want to play
           let videoURLString = ""
           guard let videoURL = URL(string: videoURLString) else {
               print("no video")
               return
           }

        print("video")
           let request = URLRequest(url: videoURL)

           // Load the video in the web view
           webView.load(request)

           // Add the web view to your view hierarchy
           view.addSubview(webView)
           
           // Add constraints to position and size the web view
           webView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               webView.topAnchor.constraint(equalTo: view.topAnchor),
               webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
               webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
           ])
       }
     */
}



