//
//  ViewController.swift
//  BeautyGallery
//
//  Created by floodliu on 16/3/18.
//  Copyright © 2016年 floodliu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var beautyPicker: UIPickerView!
    
    let beauties = ["范冰冰", "李冰冰", "王菲", "杨幂", "周迅"]
    let imageName = ["fanbingbing", "libingbing", "wangfei", "yangmi", "zhouxun"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        beautyPicker.dataSource = self
        beautyPicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoToGallery" {
            let imageName = getSelectedImageName()
            let galleryViewController = segue.destinationViewController as! GalleryViewController
            galleryViewController.imageName = imageName
        }
    }
    
    func getSelectedImageName() -> String {
        let index = beautyPicker.selectedRowInComponent(0)
        return imageName[index]
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
        print("closed")
    }
}

