//
//  ViewController.swift
//  Pad
//
//  Created by skyline on 15/1/9.
//  Copyright (c) 2015年 skyline. All rights reserved.
//

import Cocoa
import WebKit
import Annie

class ViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var scrollView: NSScrollView!
    @IBOutlet weak var webView: WebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(ViewController.textDidChange), name: NSNotification.Name.NSTextDidChange, object:textView)
        // Do any additional setup after loading the view.
    }
    
    func textDidChange() {
        if let text = textView.textStorage?.string {
            let html = Annie.markdown(text)
            self.webView.mainFrame.loadHTMLString(html, baseURL: nil)
        }
    }
}

