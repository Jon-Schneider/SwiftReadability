//
//  ReadabilityViewController.swift
//  SwiftReadability
//
//  Created by Chloe on 2016-06-20.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

import Foundation
import UIKit
import WebKit

public class ReadabilityViewController: UIViewController {
    let webView = WKWebView()
    private var inProgressReadability: Readability?
    
    override public func loadView() {
        view = webView
        
        view.backgroundColor = UIColor.blue()
    }
    
    public func loadURL(url: URL) {
        inProgressReadability = Readability(url: url) { [weak self] (content, error) in
            guard let content = content else { return }
            
            _ = self?.webView.loadHTMLString(content, baseURL: url)
            
            self?.inProgressReadability = nil
        }
    }
}
