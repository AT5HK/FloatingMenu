//
//  FloatingMenuController.swift
//  FloatingMenu
//
//  Created by Auston Salvana on 8/5/15.
//  Copyright (c) 2015 ASolo. All rights reserved.
//

import UIKit

class FloatingMenuController: UIViewController {
    
    enum Direction {
        case up
        case left
    }
    
    
    var fromView: UIView!
    var blurredView: UIVisualEffectView!
    var buttonDirection = Direction.up
    var padding = CGFloat(10)
    var buttonItems = [FloatingButton]()
    var closeButton: FloatingButton!
    //delegate
    var delegate:press?
    
    init(fromView: UIView) {
        super.init(nibName: nil, bundle: nil)
        self.fromView = fromView
        modalPresentationStyle = UIModalPresentationStyle.CurrentContext
        modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //just becuase its required
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = UIImage(named: "inbox")
        
        blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .ExtraLight))
        blurredView.frame = view.bounds
        
        
        view.addSubview(imageView)
        view.addSubview(blurredView)
        
//        self.view = self.fromView
        buttonItems = [
            
            FloatingButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50), image: UIImage(named:"icon-add")!, backgroundColor: UIColor.flatRedColor()),
            
            FloatingButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50), image: UIImage(named:"model-004")!, backgroundColor: UIColor.flatRedColor()),
            
            FloatingButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50), image: UIImage(named:"model-005")!, backgroundColor: UIColor.flatRedColor()),
            
            FloatingButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50), image: UIImage(named:"model-006")!, backgroundColor: UIColor.flatRedColor()),
            
            FloatingButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50), image: UIImage(named:"model-007")!, backgroundColor: UIColor.flatRedColor())
        ]
        
        for (index, button) in enumerate(buttonItems) {
            button.center = fromView.center
            var buttonFrame = button.frame
            var multiplier = index + 1
            buttonFrame.origin.y = buttonFrame.origin.y - (CGFloat(multiplier) * CGFloat(button.frame.size.height + padding))
            button.frame = buttonFrame
            button.clipsToBounds = true
            button.backgroundColor = UIColor.flatBlueColor()
            button.addTarget(self, action:"buttonAction:", forControlEvents:.TouchUpInside)
            button.imageView?.userInteractionEnabled = false
            
            view.addSubview(button)
        }
    }
    
    
    
    // MARK - helper methods
    
    func buttonAction(sender: UIButton!) {
        dismissViewControllerAnimated(false, completion: { () -> Void in
            self.delegate = ViewController()
            if sender == self.closeButton {
               self.delegate?.cancelPress()
            } else {
                self.delegate?.headPress()
            }
        })
    }
    
    func configureButtons() {
        closeButton = FloatingButton(frame: CGRect(x: 50, y: 50, width: 50, height: 50), image: UIImage(named:"icon-close")!, backgroundColor: UIColor.flatRedColor())
        
        closeButton.center = fromView.center
        closeButton.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        closeButton.imageView?.userInteractionEnabled = false
        view.addSubview(closeButton)
    }
    
    //MARK viewwillappear
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        configureButtons()
    }
}
