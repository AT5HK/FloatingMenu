//
//  ViewController.swift
//  FloatingMenu
//
//  Created by Auston Salvana on 8/5/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, press {

    @IBOutlet weak var floatingButton: FloatingButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func presentModal(sender: UIButton) {
        presentViewController(FloatingMenuController(fromView:floatingButton), animated: true) { () -> Void in
            //
        }
    }
    
    //MARK - Protocol methods
    
    func headPress() {
        println("head was pressed")
    }
    
    func cancelPress() {
        println("Cancel was pressed")
    }

}

