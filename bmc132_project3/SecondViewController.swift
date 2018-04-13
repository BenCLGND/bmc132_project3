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

class SecondViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.enableAllOrientation = false
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.enableAllOrientation = true
    }
    
    
    @IBOutlet weak var imageChange: UIImageView!
    
    @IBAction func beginTest(_ sender: Any) {

        // TODO: Make into property
        let healthStore = HKHealthStore()
        
        // find out if HealthKit is on this device
        guard HKHealthStore.isHealthDataAvailable() else {
            print("No HealthKit on this device")
            return
        }
        
        // create a quantity type for storing heart rate
        guard let quantityType = HKObjectType.quantityType(forIdentifier:
            .heartRate) else {
                print("Unable to create quantity type")
                return
        }
        
        // request authorization for saving heart rate and save a sample
        healthStore.requestAuthorization(toShare: [quantityType], read: []) {
            okay, error in
            
            // error in requesting authorization
            if let error = error {
                print(error)
                return
            }
            
            // requested authorization and was denied
            if !okay {
                print("Not authorized to save heart rate HealtKit data")
                return
            }
            
            // create heart rate sample
            guard let heartRateType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate) else {
                print("Error: Unable to create heart rate type")
                return
            }

            var heartRateSamples: [HKQuantitySample] = []
            for _ in 1...6 {
                let heartRateQuantity = HKQuantity(unit: HKUnit(from: "count/min"), doubleValue: Double(arc4random_uniform(80) + 60))
                sleep(1)
                let heartSample = HKQuantitySample(type: heartRateType, quantity: heartRateQuantity, start: Date(), end: Date())
                heartRateSamples.append(heartSample)
            }
            
            // save the heart rate sample
            healthStore.save(heartRateSamples) {
                success, error in
                
                if let error = error {
                    print("Error saving heart sample: \(error.localizedDescription)")
                    return
                }
                
                // NOTE: Closure "captured" the local variable heartRateQuantity
                // NOTE: even though it may have run after the variable is out-of-scope
                //print("Heart rate ", heartRateQuantity, " saved:", success)
            }
        }
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        colorCount = 0;
        imageCount = 0;
        self.view.backgroundColor = UIColor.white
        
    }
    var imageCount = 0
    var colorCount = 0;
    
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Images
        guard let rainPath = Bundle.main.path(forResource: "Rain", ofType: "jpeg") else {
            print("Error")
            return
        }
        
        guard let flowerPath = Bundle.main.path(forResource: "Flower", ofType: "jpeg") else {
            print("Error")
            return
        }

        guard let mountainsPath = Bundle.main.path(forResource: "Mountains", ofType: "jpg") else {
            print("Error")
            return
        }

        guard let waterfallPath = Bundle.main.path(forResource: "Waterfall", ofType: "jpeg") else {
            print("Error")
            return
        }

        guard let sunsetPath = Bundle.main.path(forResource: "Sunset", ofType: "jpg") else {
            print("Error")
            return
        }
        
        guard let images:[UIImage] = [UIImage(contentsOfFile: rainPath)!, UIImage(contentsOfFile: flowerPath)!, UIImage(contentsOfFile: mountainsPath)!, UIImage(contentsOfFile: waterfallPath)!, UIImage(contentsOfFile: sunsetPath)!] else {
            return
        }

        let colors:[UIColor] = [lightGreen, aqua, royalBlue, paleBlue, lavender, mediumPurple, coralPink, lightPink, mistGray, lilacGray]
        
        
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(){
            if self.colorCount > 9 {
                self.colorCount = 0
            }
            else {
                self.view.backgroundColor = colors[self.colorCount]
                self.colorCount += 1
            }
            })
        
        self.view.addGestureRecognizer(UISwipeGestureRecognizer(){
            if self.imageCount > 4 {
                self.imageCount = 0
            }
            else{
                self.imageChange.image = images[self.imageCount]
                self.imageCount += 1
            }

        })
    }

    
}

