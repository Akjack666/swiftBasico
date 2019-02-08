//
//  WikiViewController.swift
//  Westeros
//
//  Created by g5 on 07/02/2019.
//  Copyright © 2019 Dani rica. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController {
    
    @IBOutlet var webView: WKWebView!
    
    @IBOutlet var gray: UIActivityIndicatorView!
    
    
    let model: House
    
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        syncModelWithView()


    }
    
    func syncModelWithView() {
        gray.isHidden = false
        gray.startAnimating()
        title = model.name
        let request = URLRequest(url: model.wikiURL)
        webView.load(request)
        
    }
    

}


extension WikiViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // Detener la animacion del activity indicator
        gray.stopAnimating()
        
        // Ocultarlo
        gray.isHidden = true
    }
}

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHander: @escaping (WKNavigationActionPolicy) -> Void) {
        
         let type = navigationAction.navigationType
        switch type {
        case .linkActivated:
            decisionHander(.cancel)
        case .formSubmitted:
            decisionHander(.cancel)
        default:
            decisionHander(.allow)
        }
    
    }
