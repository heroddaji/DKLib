//
//  DKDimView.swift
//  MashupsPOS
//
//  Created by dai on 10/14/15.
//  Copyright © 2015 Shopify. All rights reserved.
//

import UIKit

var dimViewInterval:NSTimeInterval = 0
extension UIView{
    func dimViewEnable(interval: NSTimeInterval){
        dimViewInterval = interval
        self.userInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "dimView"))
    }
    
    func dimView(){
        let dimView = UIView(frame:self.frame)
        
        dimView.backgroundColor = UIColor.blackColor()
        dimView.alpha = 0.6
        
        UIView.animateWithDuration(dimViewInterval, animations: { () -> Void in
                self.addSubview(dimView)
            })
            { (result:Bool) -> Void in
                dimView.removeFromSuperview()
        }

    }
}
