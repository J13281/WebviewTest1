//
//  NavigationWebview.swift
//  WebviewTest1
//
//  Created by 谷出広大 on 2019/11/18.
//  Copyright © 2019 谷出広大. All rights reserved.
//

import UIKit
import WebKit

class NavigationWebview: UIView {
    
    var webView: WKWebView!
    
    func load() {
        
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        
        // WKWebViewを生成
        webView = WKWebView(
            frame: CGRect.zero,
            configuration: config)
        
        let urlString = "https://www.google.com/"
        let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        
        let url = NSURL(string: encodedUrlString!)
        let request = NSURLRequest(url: url! as URL)
        
        // let userAgentStr = "My App WebView"
        // webView.customUserAgent = userAgentStr
        webView.load(request as URLRequest)
        addSubview(webView)
        
        let navigation = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        navigation.setTitle("navigation", for: .normal)
        navigation.setTitleColor(.systemBlue, for: .normal)
        navigation.addTarget(self, action: #selector(onNavigation), for: .touchUpInside)
        addSubview(navigation)
    }
    
    @objc func onNavigation() {
        
        if let urlString = UIPasteboard.general.value(forPasteboardType: "public.text") as? String {
            
            let encodedUrlString = urlString.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
            let url = NSURL(string: encodedUrlString!)
            let request = NSURLRequest(url: url! as URL)
            
            // let userAgentStr = "My App WebView"
            // webView.customUserAgent = userAgentStr
            webView.load(request as URLRequest)
            print("on navigation")
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        webView.frame = CGRect(x: 0, y: 20, width: frame.width, height: frame.height)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        load()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        load()
    }
}
