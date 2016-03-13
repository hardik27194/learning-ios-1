//
//  WKWebViewController.swift
//  WorldTrotter
//
//  Created by floodliu on 16/2/29.
//  Copyright © 2016年 floodliu. All rights reserved.
//

import UIKit
import WebKit

class WKWebViewController: UIViewController {
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
        
        let url = NSURL(string: "http://www.jianshu.com")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let yOffset = topLayoutGuide.length * 2
        webView.bounds.origin.y += yOffset
        webView.bounds.size.height -= yOffset
    }
}
