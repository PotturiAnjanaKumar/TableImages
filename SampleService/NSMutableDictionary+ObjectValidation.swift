//
//  NSMutableDictionary.swift
//  SMB
//
//  Created by vsplash on 10/13/15.
//  Copyright © 2015 BuzzBoard. All rights reserved.
//

import Foundation

public extension NSMutableDictionary{
    
    public override func returnsObjectOrNoneForKey(_ key:String) -> AnyObject{
        return super.returnsObjectOrNoneForKey(key)
    }
    
    public func setObjectOrNone(_ anyObject:AnyObject?,key:NSCopying){
        if  anyObject != nil {
            self.setObject(anyObject!, forKey: key)
        }
    }
    
    public override func returnsObjectOrNoneForAnyKey(_ key:AnyObject) -> AnyObject{
        return super.returnsObjectOrNoneForAnyKey(key)
    }
    
}
