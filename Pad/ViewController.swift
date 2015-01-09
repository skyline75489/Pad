//
//  ViewController.swift
//  Pad
//
//  Created by skyline on 15/1/9.
//  Copyright (c) 2015年 skyline. All rights reserved.
//

import Cocoa
import WebKit
import Markingbird

class ViewController: NSViewController {

    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var scrollView: NSScrollView!
    @IBOutlet weak var webView: WebView!
    
    var markdown: Markdown?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var options = MarkdownOptions()
        options.autoHyperlink = true
        options.autoNewlines = true
        options.emptyElementSuffix = ">"
        options.encodeProblemUrlCharacters = true
        options.linkEmails = false
        options.strictBoldItalic = true
        self.markdown = Markdown(options: options)
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(self, selector: Selector("textDidChange"), name: NSTextDidChangeNotification, object:textView)
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func textDidChange() {
        if let text = textView.textStorage?.string {
            let html = markdown?.transform(text)
            self.webView.mainFrame.loadHTMLString(html, baseURL: nil)
        }
    }
}

