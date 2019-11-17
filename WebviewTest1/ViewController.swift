//
//  ViewController.swift
//  WebviewTest1
//
//  Created by 谷出広大 on 2019/11/18.
//  Copyright © 2019 谷出広大. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        
        // WKWebViewを生成
        webView = WKWebView(
            frame: CGRect(
                x: 0,
                y: view.safeAreaInsets.bottom,
                width: self.view.bounds.size.width,
                height: self.view.bounds.size.height),
            configuration: config)
        
        let urlString = "https://www.google.com/"
        let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        
        let url = NSURL(string: encodedUrlString!)
        let request = NSURLRequest(url: url! as URL)
        
        // let userAgentStr = "My App WebView"
        // webView.customUserAgent = userAgentStr
        webView.load(request as URLRequest)
        
        self.view.addSubview(webView)
    }
    
    override func viewDidLayoutSubviews() {
        webView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.bottom,
            width: self.view.bounds.size.width,
            height: self.view.bounds.size.height)
    }
}
