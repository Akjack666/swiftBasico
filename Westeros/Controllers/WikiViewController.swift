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
        syncModelWithView()


    }
    
    func syncModelWithView() {
        title = model.name
        let request = URLRequest(url: model.wikiURL)
        webView.load(request)
        
    }
    
    

    

}
