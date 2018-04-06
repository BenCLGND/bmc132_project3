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

    
    
    @IBAction func resetButton(_ sender: Any) {
        count = 0;
        self.view.backgroundColor = UIColor.white
        print(#function, "\(count)")
    }
    
    var count = 0;
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:count:colors:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(tapGesture)
        self.view.isUserInteractionEnabled = true
        
        //colors
        let lightGreen = UIColor.FlatColor.LightGreen
        let aqua = UIColor.FlatColor.Aqua
        let royalBlue = UIColor.FlatColor.RoyalBlue
        let paleBlue = UIColor.FlatColor.PaleBlue
        let lavender = UIColor.FlatColor.Lavender
        let mediumPurple = UIColor.FlatColor.MediumPurple
        let coralPink = UIColor.FlatColor.CoralPink
        let lightPink = UIColor.FlatColor.LightPink
        let mistGray = UIColor.FlatColor.MistGray
        let lilacGray = UIColor.FlatColor.LilacGray
        
        let colors:[UIColor] = [lightGreen, aqua, royalBlue, paleBlue, lavender, mediumPurple, coralPink, lightPink, mistGray, lilacGray]
        
        handleTap(sender: tapGesture, count: count, colors: colors)
        
        self.view.backgroundColor = UIColor.FlatColor.Aqua
    }

    @objc func handleTap(sender: UITapGestureRecognizer, count: Int, colors: [UIColor]) {
        if sender.state == .ended {
            if count > 9 {
                resetButton(self)
            }
            print(#function, "\(count)")
            self.view.backgroundColor = colors[count]
            
            
        }
    }

}

