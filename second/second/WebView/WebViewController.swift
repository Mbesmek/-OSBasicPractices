//
//  WebViewController.swift
//  second
//
//  Created by Melih Bugra Esmek on 15.09.2021.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {
    
    var webView : WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://www.yemeksepeti.com")!
        webView.load(URLRequest(url: url))
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false 
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

  

}
