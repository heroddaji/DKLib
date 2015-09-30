//
//  DKStoryboard.swift
//  DKLib
//
//  Created by dai on 9/30/15.
//  Copyright © 2015 nevitech. All rights reserved.
//

import UIKit

func loadViewFrom(storyboardId:String, viewControllerId:String? = nil) -> UIViewController {
    let sb = UIStoryboard(name: storyboardId, bundle: nil)
    var vc:UIViewController!
    
    if viewControllerId == nil {
        vc = sb.instantiateInitialViewController()
    }else{
        vc = sb.instantiateViewControllerWithIdentifier(viewControllerId!)
    }
    
    return vc
}