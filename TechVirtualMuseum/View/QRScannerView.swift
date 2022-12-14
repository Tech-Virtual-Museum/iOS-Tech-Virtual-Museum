//
//  QRScannerView.swift
//  TechVirtualMuseum
//
//  Created by Nahima Ortega on 2/12/22.
//

import SwiftUI
import CodeScanner

struct QRScannerView: View {
    var firestoreService = FirestoreService()

    @State var presentingScannerView = true
    @State var scannedQRCode = ""
    @State var isHiddenLoader: Bool = false
    @State var isCodeScanned: Bool = false
    
    
    
    var scanner: some View {
        CodeScannerView(codeTypes: [.qr], shouldVibrateOnSuccess: true, completion: {result in if case let .success(code) = result {
            self.scannedQRCode = code.string
            isCodeScanned = true
            print(self.scannedQRCode)
            firestoreService.getDocumentWithDocumentId(collectionId: "products", documentId: self.scannedQRCode) {
                (error, documentData) in
                    //self.presentDestinationViewController(item: documentData)
            }
            
            self.presentingScannerView = false
        }})
    }
    
    
    var body: some View {
        ZStack(alignment: .top) {
            HStack {
                Text("Scanning...")
                    .padding()
                    .foregroundColor(.black)
                    .font(.custom("Roboto Black", size: 24))
                LoaderView()
            }
            Button("Go to the scanned item"){
               
            }.opacity(isCodeScanned ? 1 : 0)

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
