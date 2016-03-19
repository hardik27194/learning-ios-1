//
//  JapaneseViewController.swift
//  BeautyGallery
//
//  Created by floodliu on 16/3/19.
//  Copyright © 2016年 floodliu. All rights reserved.
//

import UIKit

class JapaneseViewController: UIViewController {
    
    @IBOutlet weak var beautyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        let imageShare = ImageShare()
        if let image = beautyImage.image {
            imageShare.share(self, image: image, serviceType: serviceType)
        }
    }
}
