//
//  DKQueue.swift
//  MashupsBeaconSample
//
//  Created by dai on 9/30/15.
//  Copyright © 2015 mashups. All rights reserved.
//

import Foundation

class DKQueue{
    
    class func main(block:()->()){
        dispatch_async(dispatch_get_main_queue(), block)
    }
}