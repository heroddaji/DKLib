//
//  DKStore.swift
//  MashupsBeaconSample
//
//  Created by dai on 9/23/15.
//  Copyright © 2015 mashups. All rights reserved.
//

import UIKit

class DKArchiveStore:NSObject {
    
    static private var myself:DKArchiveStore!
    static var sharedInstance:DKArchiveStore {
        get{
            if myself == nil{
                myself = DKArchiveStore()
            }
            return myself
        }
    }

    private var archiveUrl:NSURL!
    private var archObjs = [NSCoding]()
    private var savePath = "DKStore"
    
    override init(){
        super.init()
        let docDirectory = NSFileManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).first!
        archiveUrl = docDirectory.URLByAppendingPathComponent(savePath)
        
    }
    
    func appendObj(obj:NSCoding){
        archObjs.append(obj)
    }

    func appendObjs(objs:[NSCoding]){
        archObjs += objs
    }
    
    /*
    will replace the archObjs with new ones
    */
    func saveObjs(objs:[NSCoding]){
        archObjs = objs
    }

    func flush() -> Bool{
        dump(archiveUrl)
        return NSKeyedArchiver.archiveRootObject(archObjs, toFile: archiveUrl.path!)
    }
    
    func loadObjs() -> [NSCoding] {
        if archObjs.count > 0 {
            return archObjs
        }
        else{
            if let objs = NSKeyedUnarchiver.unarchiveObjectWithFile(archiveUrl.path!) as? [NSCoding]{
                archObjs = objs
            }
        }
    
        return archObjs
    }
    
}


