//
//  InterfaceController.swift
//  WatchExtension Extension
//
//  Created by Clark,Benjamin on 4/25/18.
//  Copyright © 2018 Clark,Benjamin. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var dieSelection: WKInterfacePicker!
    @IBOutlet var numberAcquired: WKInterfaceLabel!
    @IBOutlet var rollButton: WKInterfaceButton!
    
    @IBAction func pickerItemChanged(_ value: Int) {
        print("List Picker: \(dieList[value]) selected")
        index = value
    }
    
    @IBAction func rollDie() {
        print("Pushed")
        if index == 0 {
            
        }
    }
    var index = 0
    
    var dieList : [String] = [
        "Four-Sided",
        "Six-Sided",
        "Eight-Sided",
        "Ten-Sided",
        "Twelve-Sided",
        "Twenty-Sided"]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        // Configure interface objects here.
    }
    

    override func willActivate() {
        super.willActivate()
        
        let pickerItems: [WKPickerItem] = dieList.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            return pickerItem
        }
        dieSelection.setItems(pickerItems)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
