//
//  ViewController.swift
//  cursor-arrow-keys
//
//  Created by Cezar Carvalho Pereira on 24/1/15.
//  Copyright (c) 2015 Wavebits. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textView: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView?.setupInputAccessoryView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

