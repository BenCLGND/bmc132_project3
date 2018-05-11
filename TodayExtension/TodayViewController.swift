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
    
    let sharedDefaults = UserDefaults.init(suiteName: "group.edu.uakron.cs.ios.bmc132")
    

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
        print("Oh my")
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        print("Oh my 2")
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .compact {
            self.preferredContentSize = maxSize
        } else if activeDisplayMode == .expanded {
            self.preferredContentSize = CGSize(width: maxSize.width, height: 300)
        }
    }
    
}
