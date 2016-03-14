//
//  ViewController.swift
//  ChineseZodiac
//
//  Created by floodliu on 16/3/14.
//  Copyright © 2016年 floodliu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yearOfBirth: UITextField!
    @IBOutlet weak var imageOfZodiac: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        showZodiac(yearOfBirth)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        showZodiac(yearOfBirth)
    }

    @IBAction func showZodiac(sender: AnyObject) {
        yearOfBirth.resignFirstResponder()
        
        let numberFormatter = NSNumberFormatter()
        if let year = numberFormatter.numberFromString(yearOfBirth.text!)?.integerValue {
            let indexOfZodiac = getIndexOfZodiac(year)
            imageOfZodiac.image = UIImage(named: String(indexOfZodiac))
        } else {
            let unknownZodiac = "unknown"
            imageOfZodiac.image = UIImage(named: unknownZodiac)
        }
    }
    
    func getIndexOfZodiac(year: Int) -> Int {
        let numberOfZodiac = 12
        let offset = 1984 % numberOfZodiac  // 1984 is the year of the rat
        return (year - offset + numberOfZodiac) % numberOfZodiac
    }

}

