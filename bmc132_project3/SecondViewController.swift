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
        struct Green {
            
        }
        
        struct Blue {
            
        }
        
        struct Violet {
            static let lavender = UIColor(netHex: 0xE6E6FA)
        }
        
        struct Yellow {
            
        }
        
        struct Orange {
            
        }
        
        struct Red {
            
        }
        
        struct Gray {
            
        }
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
    
    
    let lavender = UIColor.FlatColor.Violet.lavender
    //let blueGray = UIColor(red: 104.0/255, green: 118.0/255, blue: 129.0/255, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }



}

