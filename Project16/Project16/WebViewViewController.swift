//
//  WebViewViewController.swift
//  Project16
//
//  Created by Anish Kochhar on 29/03/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var website: String = ""
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        guard let url = URL(string: website) else { return }
        webView.load(URLRequest(url: url))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url?.absoluteString
        
        if url == website {
            decisionHandler(.allow)
        } else {
            let ac = UIAlertController(title: "Navigation is banned", message: "sorry bud", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            present(ac, animated: true)
            
            decisionHandler(.cancel)
        }
        
        
    }

}
