//
//  NSDictionary.swift
//  SMB
//
//  Created by vsplash on 10/13/15.
//  Copyright © 2015 BuzzBoard. All rights reserved.
//

import Foundation

public extension NSDictionary{
    
    //Returns Empty string when the object is nil.
    
    public func returnsObjectOrNoneForKey(_ key:String) -> AnyObject{
        let object:AnyObject? = self.object(forKey: key) as AnyObject?
        if (object != nil){
            return object!
        }
        return "" as AnyObject;
    }
    
    public func returnsObjectOrNoneForAnyKey(_ key:AnyObject) -> AnyObject{
        let object:AnyObject? = self.object(forKey: key) as AnyObject?
        if (object != nil){
            return object!
        }
        return "" as AnyObject;
    }
    
}
