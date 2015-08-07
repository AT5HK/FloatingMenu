//
//  FloatingButton.swift
//  FloatingMenu
//
//  Created by Auston Salvana on 8/5/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

import UIKit
import QuartzCore

class FloatingButton: UIButton {

    
    init(frame: CGRect, image: UIImage, backgroundColor: UIColor) {
        super.init(frame: frame)
    
        self.frame = frame
        self.backgroundColor = backgroundColor
        userInteractionEnabled = true
        setImage(image, forState:UIControlState.Normal)
        setBackgroundImage(backgroundColor.pixelImage, forState: UIControlState.Highlighted)
        imageView?.userInteractionEnabled = true
        
        tintColor = UIColor.whiteColor()
        layer.cornerRadius = frame.width/2
        layer.masksToBounds = true
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setup() {
        tintColor = UIColor.whiteColor()
        layer.cornerRadius = frame.width/2
        layer.masksToBounds = true
        setBackgroundImage(UIColor.flatBlueColor().pixelImage, forState: UIControlState.Normal)
    }
    
    override func awakeFromNib() {
        setup()
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
