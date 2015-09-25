//
//  DKFloatingControl.swift
//  DressRoom
//
//  Created by daitran on 5/24/15.
//  Copyright (c) 2015 daitran. All rights reserved.
//

import UIKit

enum DKDirection {
    case Left
    case Right
    case Down
    case Up
}
class DKFloatingControl: UIButton {
    
    
    
    var duration = 0.2
    var delayTime = 0.0
    var dampingRatio:CGFloat = 0.99
    var velocity:CGFloat = 0.7
    var direction:DKDirection = .Right
    
    var spaceBetweenItem:CGFloat = 10
    var isOpen = false
    var sizeOfOneSubControl:CGFloat {
        get{
            return spaceBetweenItem + self.frame.width
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        initView()
    }
    
    func initView(){
        let tapGesture = UITapGestureRecognizer(target: self, action: "respondsToTap:")
        self.addGestureRecognizer(tapGesture)
        //   self.addTarget(self, action: "respondsToTap", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        //tip: found this trick on https://developer.apple.com/library/ios/qa/qa2013/qa1812.html
        if isOpen{
            for anyobj in self.subviews {
                if anyobj is DKFloatingControlItem{
                    let view = anyobj as! DKFloatingControlItem
                    let pointForSubView = view.convertPoint(point, fromView: self)
                    
                    if CGRectContainsPoint(view.bounds, pointForSubView){
                        return view
                    }
                }
                
            }
        }
        
        return super.hitTest(point, withEvent: event)
        
    }
    
    func addFloatingItem(floatingItem: DKFloatingControlItem){
        floatingItem.userInteractionEnabled = true
        floatingItem.alpha = 0
        floatingItem.hidden = true
        floatingItem.tag = 1
        self.addSubview(floatingItem)
    }
    
    func floatingMenuTap(sender: DKFloatingControlItem){
    }
    
    func respondsToTap(sender: UITapGestureRecognizer){
        
        if isOpen == true{
            isOpen = false
        }else{
            isOpen = true
            self.superview?.bringSubviewToFront(self)
        }
        
        animateFloatingMenu(isOpen)
    }
    
    
    func animateFloatingMenu(isOpen:Bool){
        
        let openTranslationBlock :  (DKDirection,CGFloat) -> CGAffineTransform = {
            [weak self] (direction:DKDirection, index:CGFloat) -> CGAffineTransform in
            
            let delta = (self!.frame.width + self!.spaceBetweenItem) * index

            switch direction{
            case .Left:
                return CGAffineTransformMakeTranslation(-delta , 0)
                
            case .Right:
                return CGAffineTransformMakeTranslation(delta , 0)
                
            case .Down:
                return CGAffineTransformMakeTranslation(0 , delta)
            case .Up:
                return CGAffineTransformMakeTranslation(0 , -delta)
            }
        }
        
        let closeTranslationBlock :  () -> CGAffineTransform = {
            [weak self] () -> CGAffineTransform in
            return CGAffineTransformMakeTranslation(self!.bounds.width/2 , 0)
        }
        
        
        let animation = { [weak self]() -> Void in
            var index:CGFloat = 1
            for anyobj in self!.subviews {
                if isOpen && anyobj is DKFloatingControlItem{
                    let translationTransform =  openTranslationBlock(self!.direction,index)
                    let view = anyobj as! DKFloatingControlItem
                    view.hidden = false
                    view.alpha =  1
                    view.transform  = translationTransform
                    index += 1
                    self!.onOpen()
                }else{
                    let translationTransform =  closeTranslationBlock()
                    let view = anyobj
                    view.transform = translationTransform
                    view.alpha = 0
                    self!.onClose()
                }
                
            }
            
            //rotate main menu icon 45 degree
            //let rotationTransform = rotationBlock(45)
            //self.imageView?.transform = rotationTransform
            
        }
        
        let completion  = { (bool:Bool) -> Void in
            if !isOpen{
                for view in self.subviews {                    
                    view.hidden = false
                }
                
            }
        }
        
               UIView.animateWithDuration(duration, delay: delayTime, options: UIViewAnimationOptions.AllowUserInteraction, animations: animation, completion: completion)
               // UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: dampingRatio, initialSpringVelocity: velocity, options: UIViewAnimationOptions.AllowUserInteraction, animations: animation, completion: completion)
        
        
        
    }
    
    func close(){
        isOpen = false
        animateFloatingMenu(isOpen)
    }
    
    func onOpen(){
        
    }
    
    func onClose(){
        
    }
    
    
}
