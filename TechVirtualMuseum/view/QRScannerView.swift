//
//  QRScannerView.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 2/12/22.
//

import SwiftUI
import CodeScanner

struct QRScannerView: View {
    
    @State var presentingScannerView = false
    @State var scannedQRCode = "Scan the QR Code"
    
    var scanner: some View {
        CodeScannerView(codeTypes: [.qr], completion: {result in if case let .success(code) = result {
            self.scannedQRCode = code.string
            self.presentingScannerView = false
        }})
    }
    
    
    var body: some View {
        VStack() {
            Text(scannedQRCode)
                .padding()
                .foregroundColor(.white)
                .background(Color.yellow)
                .font(.headline)
            
            Button("Scan QR Code") {
                self.presentingScannerView = true
            }
            .padding()
            .clipShape(Capsule())
            .sheet(isPresented: $presentingScannerView) {
                self.scanner
            }
        }
    }
}

struct QRScannerView_Previews: PreviewProvider {
    static var previews: some View {
        QRScannerView()
    }
}
