//
//  PopoverPresenter.swift
//  XaBar
//
//  Created by Jan Kožnárek on 17.11.2020.
//  Copyright © 2020 Jan Kožnárek. All rights reserved.
//

import Cocoa

protocol MainView where Self: NSViewController {
    
}

class MainPresenter {
    
    let view: PopoverView
    
    init(view: PopoverView) {
        self.view = view
    }
    
    
    
}
