//
//  DKArchivable.swift
//  MashupsBeaconSample
//
//  Created by dai on 9/23/15.
//  Copyright © 2015 mashups. All rights reserved.
//
import Foundation

class DKArchivable:NSObject,NSCoding {
    
    var value:AnyObject!
    
    override init() {
        super.init()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        
        if let deCodeObj = aDecoder.decodeObjectForKey(String(self.classForCoder)){
            value = deCodeObj
        }
        else{
            return nil
        }
        
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self, forKey: String(self.classForCoder))
    }
}
