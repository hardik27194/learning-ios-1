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
        celsiusLabel.text = "???"
    }

    func updateCelsiusLabel() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.stringFromNumber(value)
        } else {
            celsiusLabel.text = "???"
        }
    }

    @IBAction func fahrenheitFieldEditingChanged(textField: UITextField) {
        if let text = textField.text, value = Double(text) {
            fahrenheitValue = value
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
        let decimalSeparator = "."
        let existingTextHasDecimalSeparator = textField.text?.rangeOfString(decimalSeparator)
        let replacementTextHasDecimalSeparator = string.rangeOfString(decimalSeparator)

        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
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