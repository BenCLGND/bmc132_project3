//
//  FirstViewController.swift
//  bmc132_project3
//
//  Created by Clark,Benjamin on 4/2/18.
//  Copyright © 2018 Clark,Benjamin. All rights reserved.
//

import UIKit
import CloudKit

//Struct to hold data for iCloud writing/reading
struct appInfo : Codable {
    
    var Name: String?
    var Age: String?
    var FavoriteGamingPlatform: String?
    var FavoriteGameGenre: String?
    var FavoriteGameDeveloper: String?
    
}

class FirstViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Variables to pass to functions
    var userInput = appInfo()
    var activeField: UITextField!
    
    
    //database
    let publicInformationDatabase = CKContainer.default().publicCloudDatabase

    
    //MARK: Text Field References
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var gamePlatformField: UITextField!
    @IBOutlet weak var gameGenreField: UITextField!
    @IBOutlet weak var gameDeveloperField: UITextField!
    
    //MARK: iCloud Submit Button
    //Submit Button to allow record creation and save
    @IBAction func submitButton(_ sender: Any) {
        
        guard let sharedDefaults = UserDefaults.init(suiteName: "group.edu.uakron.cs.ios.bmc132") else {
            print("Error")
            return
        }

        //var name = self.userInput.Name
        //var age = sharedDefaults.string(forKey: "age")
        //var favGamePlatform = sharedDefaults.string(forKey: "gamePlatform")
        //var favGameGenre = sharedDefaults.string(forKey: "gameGenre")
        //var favGameDeveloper = sharedDefaults.string(forKey: "gameDeveloper")
        
        //Create Record
        let infoRecord = CKRecord(recordType: "Information")
        infoRecord["Name"] = (self.userInput.Name! as CKRecordValue)
        infoRecord["Age"] = self.userInput.Age! as CKRecordValue
        infoRecord["FavoriteGamePlatform"] = self.userInput.FavoriteGamingPlatform! as CKRecordValue
        infoRecord["FavoriteGameGenre"] = self.userInput.FavoriteGameGenre! as CKRecordValue
        infoRecord["FavoriteGameDeveloper"] = self.userInput.FavoriteGameDeveloper! as CKRecordValue
        
        
        // save the record in a public database
        self.publicInformationDatabase.save(infoRecord) {
            record, error in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let savedRecord = record else {
                print("Error: SAVE FAILURE")
                return
            }
            
            print(savedRecord)
        }
        
        //databaseQuery()
        
        sharedDefaults.set(self.userInput.Name, forKey: "name")
        sharedDefaults.set(self.userInput.Age, forKey: "age")
        sharedDefaults.set(self.userInput.FavoriteGamingPlatform, forKey: "gamePlatform")
        sharedDefaults.set(self.userInput.FavoriteGameGenre, forKey: "gameGenre")
        sharedDefaults.set(self.userInput.FavoriteGameDeveloper, forKey: "gameDeveloper")
        
    }
    
    //MARK: VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Delegating each textField
        self.nameField.delegate = self
        self.ageField.delegate = self
        self.gamePlatformField.delegate = self
        self.gameGenreField.delegate = self
        self.gameDeveloperField.delegate = self

        
        //MARK: Filling in text fields from plist in bundle
        defer {
            self.nameField.text = self.userInput.Name
            self.ageField.text = self.userInput.Age
            self.gamePlatformField.text = self.userInput.FavoriteGamingPlatform
            self.gameGenreField.text = self.userInput.FavoriteGameGenre
            self.gameDeveloperField.text = self.userInput.FavoriteGameDeveloper
          
        }
        
        
        //MARK: Begin Reading and decoding plist
        guard let userInputURL = Bundle.main.url(forResource: "userInfo", withExtension: "plist") else {
            print("Error: Path cannot be formed")
            return
        }
        
        guard let userInputData = try? Data(contentsOf: userInputURL) else {
            print("Error: Data not found")
            return
        }
        
        guard let userInput = try? PropertyListDecoder().decode(appInfo.self, from: userInputData) else {
            print("Error: Data couldn't be retrieved from plist")
            return
        }
        
        self.userInput = userInput

        
        //MARK: Moving Keyboard for text fields
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: nil) {
            notification in
            
            guard let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                print("Error: Keyboard Size not found")
                return
            }
            
            //Handle cases as to avoid certain fields from being pushed offscreen
            if self.activeField == self.nameField {
                return
            }
            else if self.activeField == self.ageField {
                return
            }
            else if self.activeField == self.gamePlatformField{
                self.view.frame.origin.y = -keyboardSize.height + 200
            }
            else if self.activeField == self.gameGenreField{
                self.view.frame.origin.y = -keyboardSize.height + 100
            }
            else {
                self.view.frame.origin.y = -keyboardSize.height + 50
            }
            
        }
        
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: nil) {
            notification in
            
            self.view.frame.origin.y = 0
        }
        
    }
    
    
    //MARK: Misc Functions for textfields
    //Puts data into struct to allow a record to be created
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        if let currentName = self.nameField.text, let currentAge = self.ageField.text, let currentFavePlatform = self.gamePlatformField.text, let currentFaveGenre = self.gameGenreField.text, let currentGameDeveloper = self.gameDeveloperField.text {
                
            //Variables to set to record
            self.userInput.Name = currentName
            self.userInput.Age = currentAge
            self.userInput.FavoriteGamingPlatform = currentFavePlatform
            self.userInput.FavoriteGameGenre = currentFaveGenre
            self.userInput.FavoriteGameDeveloper = currentGameDeveloper

        }
        
        guard let sharedDefaults = UserDefaults.init(suiteName: "group.edu.uakron.cs.ios.bmc132") else {
            print("Error")
            return true
        }
        sharedDefaults.set(self.userInput.Name, forKey: "name")
        sharedDefaults.set(self.userInput.Age, forKey: "age")
        sharedDefaults.set(self.userInput.FavoriteGamingPlatform, forKey: "gamePlatform")
        sharedDefaults.set(self.userInput.FavoriteGameGenre, forKey: "gameGenre")
        sharedDefaults.set(self.userInput.FavoriteGameDeveloper, forKey: "gameDeveloper")
        return true
    }
    
    //Allows textFields to be marked as active to make handling easier
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    //Allows records to be pulled
    func databaseQuery() {
        
        // setup query
        let predicate = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: "Name", ascending: false)
        let query = CKQuery(recordType: "Information", predicate: predicate)
        query.sortDescriptors = [sort]
        
        // create the initial query operation
        let queryOperation = CKQueryOperation(query: query)
        queryOperation.database = publicInformationDatabase
        queryOperation.recordFetchedBlock = {
            record in
            
            // Process each record
            print(record)
        }
        queryOperation.queryCompletionBlock = {
            cursor, error in
            
            if let error = error {
                print(error)
                return
            }
            
            // NOTE: If the cursor is not nil, then more records are available
            guard let queryCursor = cursor else {
                print("No cursor")
                return
            }
            
            print(queryCursor)
        }
        
        publicInformationDatabase.add(queryOperation)
    }
}


