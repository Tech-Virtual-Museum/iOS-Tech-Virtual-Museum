//
//  QRScannerView.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 2/12/22.
//

import SwiftUI
import CodeScanner

struct QRScannerView: View {
    
    @State var presentingScannerView = true
    @State var scannedQRCode = "Scan the QR Code"
    
    var scanner: some View {
        CodeScannerView(codeTypes: [.qr], shouldVibrateOnSuccess: true, completion: {result in if case let .success(code) = result {
            self.scannedQRCode = code.string
            self.presentingScannerView = false
        }})
    }
    
    
    var body: some View {
        VStack {
            Text("Scanning...")
                .padding()
                .foregroundColor(.black)
                .font(.custom("Roboto Black", size: 28))
            self.scanner
        }
    }
}


struct LoaderView: View {
    var tintColor: Color = .black
    var scaleSize: CGFloat = 1.0
    
    var body: some View {
        ProgressView()
            .scaleEffect(scaleSize, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}

struct QRScannerView_Previews: PreviewProvider {
    static var previews: some View {
        QRScannerView()
    }
}
