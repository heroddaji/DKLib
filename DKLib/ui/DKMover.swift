//
//  Mover.swift
//  truyencotich
//
//  Created by dai on 9/15/15.
//  Copyright © 2015 daitran. All rights reserved.
//

import UIKit

extension UIView{
    
    func moveAround(from:CGPoint, to:CGPoint) -> UIView{
        self.frame = CGRectMake(from.x, from.y, self.bounds.width, self.bounds.height)

        UIView.animateWithDuration(2, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.frame.origin = to
            }, completion: nil)
        
        return self
    }
    
}