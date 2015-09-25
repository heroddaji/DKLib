//
//  DKUIView+Animation.swift
//  FashionDisco
//
//  Created by daitran on 7/14/15.
//  Copyright © 2015 daitran. All rights reserved.
//

import UIKit

typealias DKUIView =  UIView

extension DKUIView {
    func dkui_scaleAndPinToTopLeftEgde(scaleX:CGFloat,scaleY:CGFloat) -> DKUIView {
        
        let oldx = self.frame.origin.x
        let oldy = self.frame.origin.y
        
        let t = CGAffineTransformMakeScale(scaleX,scaleY)
        // t = CGAffineTransformTranslate(t, -self.bounds.width * (1 - scale), -self.bounds.height * (1 - scale))
        
        self.transform = t
        self.frame.origin.x = oldx
        self.frame.origin.y = oldy
        return self
    }
    
}
