//
//  MainVC.swift
//  Emergency OCR
//
//  Created by Jan Kožnárek on 25.07.2021.
//  Copyright © 2021 Scott Liu. All rights reserved.
//

import Cocoa

class MainVC: NSViewController {

    var ocr: SLTesseract!
    
    @IBOutlet var previewImage: NSImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ocr = SLTesseract.init()
        
    }
    
    @IBAction func buttonPressed(_ sender: NSButton) {
        
        SLScreenshot.take { image in
            self.previewImage.image = image
            self.imageToText()
        }
        
    }
    
    
    private func imageToText() {
        
        ocr.language = "ces"
        
        let text: String = ocr.recognize(previewImage.image)
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(text, forType: .string)
        
        print("----------------------------------------------------")
        print("OCR Text: ", text)
        print("----------------------------------------------------")
        
    }
    
}
