//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by hongtao on 16/2/18.
//  Copyright © 2016年 floodliu. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!

    var fahrenheitValue: Double? {
        didSet {
            updateCelsiusLabel()
        }
    }

    var celsiusValue: Double? {
        if let value = fahrenheitValue {
            return (value - 32) * (5 / 9)
        } else {
            return nil
        }
    }

    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        celsiusLabel.text = "???"
        print("ConversionViewController loaded its view.")
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if isAM() {
            view.backgroundColor = UIColor.whiteColor()
        } else {
            view.backgroundColor = UIColor.lightGrayColor()
        }
    }

    func isAM() -> Bool {
        let now = NSDate()
        return now.compare(startOfTodaysMorning()) == NSComparisonResult.OrderedDescending
            && now.compare(endOfTodaysMorning()) == NSComparisonResult.OrderedAscending
    }

    func startOfTodaysMorning() -> NSDate {
        let dateComponents = getTodaysDateComponents()
        let year = dateComponents.year
        let month = dateComponents.month
        let day = dateComponents.day
        return createDate(year, month: month, day: day, hour: 0, minute: 0, second: 0)
    }

    func endOfTodaysMorning() -> NSDate {
        let dateComponents = getTodaysDateComponents()
        let year = dateComponents.year
        let month = dateComponents.month
        let day = dateComponents.day
        return createDate(year, month: month, day: day, hour: 11, minute: 59, second: 0)
    }

    func getTodaysDateComponents() -> NSDateComponents {
        let today = NSDate()
        let unitFlags: NSCalendarUnit = [.Year, .Month, .Day, .Hour, .Minute, .Second]
        let dateComponents = NSCalendar.currentCalendar().components(unitFlags, fromDate: today)
        return dateComponents
    }

    func createDate(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) -> NSDate {
        let dateComponents = NSDateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second

        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let date = calendar!.dateFromComponents(dateComponents)
        return date!
    }

    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        } else {
            celsiusLabel.text = "???"
        }
    }

    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        if let text = textField.text, number = numberFormatter.numberFromString(text) {
            fahrenheitValue = number.doubleValue
        } else {
            fahrenheitValue = nil
        }
    }

    @IBAction func dismissKeyboard(sender: AnyObject) {
        textField.resignFirstResponder()
    }

    func textField(textField: UITextField,
            shouldChangeCharactersInRange range: NSRange,
            replacementString string: String) -> Bool {

        // 1. only digits and . can be accepted.
        // 2. only one . can be accepted.
        let currentLocale = NSLocale.currentLocale()
        let decimalSeparator = currentLocale.objectForKey(NSLocaleDecimalSeparator) as! String

        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(decimalSeparator)
        let replacementTextHasDecimalSeparator = string.rangeOfString(decimalSeparator)

        let duplicatedDecimalSeparator = existingTextHasDecimalSeparator != nil
            && replacementTextHasDecimalSeparator != nil
        if duplicatedDecimalSeparator {
            return false
        } else {
            let setOfDecimalDigits = NSCharacterSet.decimalDigitCharacterSet()
            let setOfDecimalSeparator = NSCharacterSet(charactersInString: decimalSeparator)

            let isDigit = string.stringByTrimmingCharactersInSet(setOfDecimalDigits).isEmpty
            let isDecimalSeparator = string.stringByTrimmingCharactersInSet(setOfDecimalSeparator).isEmpty

            return isDigit || isDecimalSeparator
        }
    }
}