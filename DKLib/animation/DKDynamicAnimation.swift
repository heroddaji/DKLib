//
//  DKRandomMove.swift
//  truyencotich
//
//  Created by dai on 10/1/15.
//  Copyright © 2015 daitran. All rights reserved.
//

import UIKit


class DKDynamicAnimation:UIView {
    
    static var animator:UIDynamicAnimator!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        myInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func myInit(){
        DKDynamicAnimation.animator = UIDynamicAnimator(referenceView: self.superview!)
        var gravityBehavior = UIGravityBehavior(items: [self])
        DKDynamicAnimation.animator.addBehavior(gravityBehavior)
    }
    
}

protocol DKDynamicAnimationPro{
    
    func setup()}

extension DKDynamicAnimationPro where Self:UIView {
    
    func setup(){
        DKDynamicAnimation.animator = UIDynamicAnimator(referenceView: self.superview!)
        let gravityBehavior = UIGravityBehavior(items: [self])
        DKDynamicAnimation.animator.addBehavior(gravityBehavior)
    }
    
}
