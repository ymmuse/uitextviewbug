//
//  ViewController.swift
//  demo
//
//  Created by max on 7/30/16.
//  Copyright © 2016 none. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let textView = UITextView(frame: self.view.bounds)
        
        let mutableString = NSMutableAttributedString()
        let paragraghStyle = NSMutableParagraphStyle()
        let textAttachemnt = NSTextAttachment()
        
        let image = UIImage(named: "demo")
        let factor = CGFloat((self.view.bounds.size.width - 10) / (image?.size.width)!)
        
        textAttachemnt.image = image
        textAttachemnt.bounds = CGRectMake(0, 0, self.view.bounds.size.width - 10, (image?.size.height)! * factor)
        
        // only setting lineSpacing it's all right 
//        paragraghStyle.lineSpacing = 6;
        
        // Setting lineHeight trigger the bug
        paragraghStyle.maximumLineHeight = 30;
        paragraghStyle.minimumLineHeight = 30;
    
        mutableString.appendAttributedString(NSAttributedString(string: "\n\n\nImage top"))
        mutableString.appendAttributedString(NSAttributedString(attachment: textAttachemnt))
        mutableString.appendAttributedString(NSAttributedString(string: "Image bottom"))
        mutableString.addAttributes([NSParagraphStyleAttributeName:paragraghStyle], range: NSMakeRange(0, mutableString.length))
        
        
        textView.attributedText = mutableString
        
        self.view .addSubview(textView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

