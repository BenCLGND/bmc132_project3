//
//  SecondViewController.swift
//  bmc132_project3
//
//  Created by Clark,Benjamin on 4/2/18.
//  Copyright © 2018 Clark,Benjamin. All rights reserved.
//

import UIKit
import CloudKit
import HealthKit

extension UIColor {
    struct FlatColor {
   
            static let LightGreen = UIColor(netHex: 0x80B880)
            static let Aqua = UIColor(netHex: 0x66cdaa)
            static let RoyalBlue = UIColor(netHex: 0x4169E1)
            static let PaleBlue = UIColor(netHex: 0xb0c4de)
            static let Lavender = UIColor(netHex: 0xE6E6FA)
            static let MediumPurple = UIColor(netHex: 0x9370DB)
            static let CoralPink = UIColor(netHex: 0xFFAAB9)
            static let LightPink = UIColor(netHex: 0xFFB6C1)
            static let MistGray = UIColor(netHex: 0xd8d8d8)
            static let LilacGray = UIColor(netHex: 0x9E9CA9)

    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

class SecondViewController: UIViewController {

    
    @IBOutlet var pictureChange: UISwipeGestureRecognizer!
    @IBOutlet var colorChange: UITapGestureRecognizer!
    
    /*
    //Colors for background
    let lavender = UIColor.FlatColor.Violet.Lavender
    let lightGreen = UIColor.FlatColor.Green.LightGreen
    let aqua = UIColor.FlatColor.Green.Aqua
    let navyBlue = UIColor.FlatColor.Blue.NavyBlue
    let paleBlue = UIColor.FlatColor.Blue.PaleBlue
    let darkPurple = UIColor.FlatColor.Violet.DarkPurple
    let coralPink = UIColor.FlatColor.Red.CoralPink
    let lightPink = UIColor.FlatColor.Red.LightPink
    let mistGray = UIColor.FlatColor.Gray.MistGray
    let lilacGray = UIColor.FlatColor.Gray.LilacGray
    
    let colors = [.lavender, .lightGreen, .aqua, .navyBlue, .paleBlue, .darkPurple, .coralPink, .lightPink, .mistGray, .lilacGray]
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }



}

