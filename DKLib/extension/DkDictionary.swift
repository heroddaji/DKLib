//
//  DK_Dictionary.swift
//  BeaconDisco
//
//  Created by dai on 9/15/15.
//  Copyright © 2015 mashups. All rights reserved.
//

import Foundation

//extend dictionary to have postscript index access like this [1]
enum DkDictionaryOption{
    case Postion
}
extension Dictionary{
    subscript(type:DkDictionaryOption, typeValue:AnyObject?) -> (Key, Value)?{
        
        if type == .Postion {
            if typeValue is Int{
                let number = typeValue as! Int
                var count = 0
                for (key,value) in self {
                    if count == number {
                        return (key,value)
                    }
                    count++
                }
            }
        }
        
        return nil
    }
}