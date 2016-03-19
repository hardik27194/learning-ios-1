//
//  GalleryViewController.swift
//  BeautyGallery
//
//  Created by floodliu on 16/3/18.
//  Copyright © 2016年 floodliu. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var beautyImage: UIImageView!
    
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let imgName = imageName {
            beautyImage.image = UIImage(named: imgName)
        }
        
        if let beautyName = getBeautyName() {
            navigationItem.title = beautyName
        } else {
            navigationItem.title = "美女画廊"
        }

    }
    
    let beautyImagesAndNames = ["fanbingbing": "范冰冰", "libingbing": "李冰冰", "wangfei": "王菲", "yangmi": "杨幂", "zhouxun": "周迅"]
    
    func getBeautyName() -> String? {
        if let imgName = imageName {
            return beautyImagesAndNames[imgName]
        } else {
            return nil
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func facebookTapped(sender: AnyObject) {
        shareTo(ImageShare.facebook)
    }
    
    @IBAction func twitterTapped(sender: AnyObject) {
        shareTo(ImageShare.twitter)
    }
    
    @IBAction func sinaWeiboTapped(sender: AnyObject) {
        shareTo(ImageShare.sinaWeibo)
    }
    
    
    func shareTo(serviceType: String) {
        if let image = beautyImage.image {
            let imageShare = ImageShare()
            imageShare.share(self, image: image, serviceType: serviceType)
        }
    }
}
