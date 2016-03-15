//
//  ViewController.swift
//  LoveFinder
//
//  Created by floodliu on 16/3/15.
//  Copyright © 2016年 floodliu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var birthday: UIDatePicker!
    @IBOutlet weak var height: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var hasProperty: UISwitch!
    @IBOutlet weak var personalInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        name.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        name.resignFirstResponder()
        return true
    }
    
    @IBAction func heightChanged(sender: AnyObject) {
        let heightNumber = getHeightNumber()
        heightLabel.text = "\(heightNumber)厘米"
    }
    
    @IBAction func showPersonalInfo(sender: AnyObject) {
        let nameText = getNameText()
        let genderText = getGenderText()
        let ageNumber = getAgeNumber()
        let heightNumber = getHeightNumber()
        let propertyText = getPropertyText()
        
        let personalInfoText = "\(nameText), \(genderText), \(ageNumber)岁, \(heightNumber)厘米, \(propertyText)。"
        personalInfo.text = personalInfoText
    }
    
    func getNameText() -> String {
        if let nameText = name.text {
            return nameText
        } else {
            return "no name"
        }
    }
    
    func getGenderText() -> String {
        let selectedIndex = gender.selectedSegmentIndex
        if let genderText = gender.titleForSegmentAtIndex(selectedIndex) {
            return genderText
        } else {
            return "wrong gender"
        }
    }
    
    func getAgeNumber() -> Int {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let now = NSDate()
        let dateOfBirth = birthday.date
        let components = calendar?.components(.Year, fromDate: dateOfBirth, toDate: now, options: NSCalendarOptions(rawValue: 0))
        return components!.year
    }
    
    func getHeightNumber() -> Int {
        return Int(height.value)
    }
    
    func getPropertyText() -> String {
        return hasProperty.on ? "有房" : "没房"
    }
}

