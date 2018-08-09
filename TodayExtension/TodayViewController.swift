//
//  TodayViewController.swift
//  TodayExtension
//
//  Created by Clark,Benjamin on 4/25/18.
//  Copyright © 2018 Clark,Benjamin. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    

    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var favGamingPlatformLabel: UILabel!
    @IBOutlet weak var FavoriteGamingGenreLabel: UILabel!
    @IBOutlet weak var favoriteGameDeveloperLabel: UILabel!
    
    //Allow user to open app to edit info
    @IBAction func updateButton(_ sender: Any) {
        extensionContext?.open(URL(string: "gameExperiment://")!, completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        guard let sharedDefaults = UserDefaults.init(suiteName: "group.edu.uakron.cs.ios.bmc132") else {
            print("Error")
            return
        }
        
        //Set Labels
        self.nameLabel.text = sharedDefaults.string(forKey: "name")
        self.ageLabel.text = sharedDefaults.string(forKey: "age")
        self.favGamingPlatformLabel.text = sharedDefaults.string(forKey: "gamePlatform")
        self.FavoriteGamingGenreLabel.text = sharedDefaults.string(forKey: "gameGenre")
        self.favoriteGameDeveloperLabel.text = sharedDefaults.string(forKey: "gameDeveloper")
        

    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        guard let sharedDefaults = UserDefaults.init(suiteName: "group.edu.uakron.cs.ios.bmc132") else {
            print("Error")
            return
        }
        
        //Set Labels
        self.nameLabel.text = sharedDefaults.string(forKey: "name")
        self.ageLabel.text = sharedDefaults.string(forKey: "age")
        self.favGamingPlatformLabel.text = sharedDefaults.string(forKey: "gamePlatform")
        self.FavoriteGamingGenreLabel.text = sharedDefaults.string(forKey: "gameGenre")
        self.favoriteGameDeveloperLabel.text = sharedDefaults.string(forKey: "gameDeveloper")

        
        
        //print(self.nameLabel.text)
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .compact {
            self.preferredContentSize = maxSize
        } else if activeDisplayMode == .expanded {
            self.preferredContentSize = CGSize(width: maxSize.width, height: 250)
        }
    }
    
}
