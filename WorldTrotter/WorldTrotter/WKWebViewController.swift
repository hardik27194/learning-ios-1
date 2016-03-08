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
        webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
        
        let url = NSURL(string: "https://www.bignerdranch.com")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
}
