//
//  SalesRep.swift
//  BBOne
//
//  Created by vsplash on 2/22/17.
//  Copyright © 2017 BuzzBoard. All rights reserved.
//

import UIKit

class SalesRep: NSObject {
    
    private struct SalesRepConstants {
      
        static let kGroups: String = "worldpopulation"
        
    }
   
    var groupsArray: [Group]?

    internal override init() {
        super.init()
    }
    internal init(responseDict:NSDictionary) {
        
        super.init()
        
        
        let salesRepGroupsArray = (responseDict.returnsObjectOrNoneForKey(SalesRepConstants.kGroups)) as AnyObject
        if (salesRepGroupsArray as AnyObject).isKind(of: NSArray.self){
            
            if let salesGroupsArray:NSArray = salesRepGroupsArray as? NSArray {
                for groupDict in salesGroupsArray{
                    if (groupDict as AnyObject).isKind(of: NSDictionary.self){
                        if let _ = self.groupsArray{
                            self.groupsArray!.append(Group(responseDict:groupDict as! NSDictionary))
                        }
                        else{
                            self.groupsArray = []
                            self.groupsArray!.append(Group(responseDict:groupDict as! NSDictionary))
                        }
                    }
                }
            }
        }        
    }
    
    func dictionaryRepresentation() -> NSMutableDictionary {
        
        let mutableDict: NSMutableDictionary = NSMutableDictionary()
        
      
        mutableDict.setObjectOrNone(self.groupsArray as AnyObject?, key: SalesRepConstants.kGroups as NSCopying)
        
        return mutableDict
    }
    
    override func copy() -> Any {
        
        let objSalesRep = SalesRep()
        
      
        var newGroupsArray: [Group] = []
        if let _ = self.groupsArray, self.groupsArray!.count > 0{
            for objGroups in self.groupsArray!{
                if objGroups is Group{
                    let objGroup: Group = objGroups
                    let newObjGroup : Group = objGroup.copy() as! Group
                    newGroupsArray.append(newObjGroup)
                }
            }
        }

        objSalesRep.groupsArray = newGroupsArray
        
        
        return objSalesRep
        
    }
    
}
