//
//  DKNumber.swift
//  cotich_spritekit
//
//  Created by dai on 10/19/15.
//  Copyright © 2015 nevitech. All rights reserved.
//

import UIKit

extension Double{
    var degreeToRadiant:Double{
        get{
            return  self * M_PI / 180.0
        }
    }
    
    var cgfloat:CGFloat{
        return CGFloat(self)
    }
}