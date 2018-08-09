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

    //Outlets
    @IBOutlet var dieSelection: WKInterfacePicker!
    @IBOutlet var numberAcquired: WKInterfaceLabel!
    @IBOutlet var rollButton: WKInterfaceButton!
    
    //Picker Action
    @IBAction func pickerItemChanged(_ value: Int) {
        //print("List Picker: \(dieList[value]) selected")
        index = value
        //print(index)
    }
    
    //Button Action
    @IBAction func rollDie() {
        //print("Pushed")
        if index == 0 {
            numberAcquired.setText(String(Int(arc4random_uniform(4)) + 1))
        }
        else if index == 1 {
            numberAcquired.setText(String(Int(arc4random_uniform(6)) + 1))
        }
        else if index == 2 {
            numberAcquired.setText(String(Int(arc4random_uniform(8)) + 1))
        }
        else if index == 3 {
            numberAcquired.setText(String(Int(arc4random_uniform(10)) + 1))
        }
        else if index == 4 {
            numberAcquired.setText(String(Int(arc4random_uniform(12)) + 1))
        }
        else if index == 5 {
            numberAcquired.setText(String(Int(arc4random_uniform(20)) + 1))
        }
        else {
            numberAcquired.setText("Error")
        }
    }
    
    //Variables
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
    }
    

    override func willActivate() {
        super.willActivate()
        
        //Set Picker
        let pickerItems: [WKPickerItem] = dieList.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0
            return pickerItem
        }
        dieSelection.setItems(pickerItems)
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
}
