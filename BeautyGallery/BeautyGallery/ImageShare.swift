//
//  ImageShare.swift
//  BeautyGallery
//
//  Created by floodliu on 16/3/19.
//  Copyright © 2016年 floodliu. All rights reserved.
//

import Social

class ImageShare {
    let text = "一起来玩美女画廊吧，就在 http://www.floodliu.com。";
    
    static let facebook = SLServiceTypeFacebook
    static let twitter = SLServiceTypeTwitter
    static let sinaWeibo = SLServiceTypeSinaWeibo
    static let tencentWeibo = SLServiceTypeTencentWeibo
    
    func share(viewController: UIViewController, image: UIImage, serviceType: String) {
        share(viewController, image: image, text: self.text, serviceType: serviceType)
    }
    
    func share(viewController: UIViewController, image: UIImage, text: String, serviceType: String) {
        let shareViewController = SLComposeViewController(forServiceType: serviceType)
        if (shareViewController != nil) {
            shareViewController.setInitialText(text)
            shareViewController.addImage(image)
            viewController.presentViewController(shareViewController, animated: true, completion: nil)
        } else {
            let alertViewController = UIAlertController(
                title: "分享失败",
                message: "未检测到您的新浪微博账号，请到系统设置中添加新浪微博的帐号。",
                preferredStyle: UIAlertControllerStyle.Alert)
            let conformAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Cancel, handler: nil)
            alertViewController.addAction(conformAction)
            viewController.presentViewController(alertViewController, animated: true, completion: nil)
        }
    }
}
