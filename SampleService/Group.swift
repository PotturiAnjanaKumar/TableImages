//
//  Group.swift
//  BBOne
//
//  Created by vsplash on 2/22/17.
//  Copyright © 2017 BuzzBoard. All rights reserved.
//

import UIKit

class Group: NSObject {
    
     private struct GroupConstants {
        static let kProfileImg: String = "flag"
        static let kListingName: String = "country"
        static let kWebsite: String = "country"
        static let kCity: String = "population"
        static let kLat: String = "population"
        static let kLng: String = "population"
    }
    
    
    var profileImg: String?
    var listingName: String?
    var website: String?
    var city: String?
    var lat: String?
    var lng:String?
    var img:UIImage?

    internal override init() {
        super.init()
    }
    internal init(responseDict:NSDictionary) {
        super.init()
        
        self.profileImg = (responseDict.returnsObjectOrNoneForKey(GroupConstants.kProfileImg) as? String)!
        self.listingName = (responseDict.returnsObjectOrNoneForKey(GroupConstants.kListingName) as? String)!
        
        if responseDict.returnsObjectOrNoneForKey(GroupConstants.kWebsite).isKind(of: NSNumber.self) {
            self.website = String(describing: responseDict.returnsObjectOrNoneForKey(GroupConstants.kWebsite))
        }
        else {
            self.website = responseDict.returnsObjectOrNoneForKey(GroupConstants.kWebsite) as? String
        }

        
        self.city = (responseDict.returnsObjectOrNoneForKey(GroupConstants.kCity) as? String)!
        self.lat = (responseDict.returnsObjectOrNoneForKey(GroupConstants.kLat) as? String)!
        self.lng = (responseDict.returnsObjectOrNoneForKey(GroupConstants.kLng) as? String)!
    }
    
    override func copy() -> Any {
        
        let groupCopy = Group()
        groupCopy.profileImg = self.profileImg?.copy() as? String
        groupCopy.listingName = self.listingName?.copy() as? String
        groupCopy.website = self.website?.copy() as? String
        groupCopy.city = self.city?.copy() as? String
        groupCopy.lat = self.lat?.copy() as? String
        groupCopy.lng = self.lng?.copy() as? String
        return groupCopy
        
    }
    
    func dictionaryRepresentation() -> NSMutableDictionary {
        
        let mutableDict: NSMutableDictionary = NSMutableDictionary()
        
        mutableDict.setObjectOrNone(self.profileImg as AnyObject?, key: GroupConstants.kProfileImg as NSCopying)
        mutableDict.setObjectOrNone(self.listingName as AnyObject?, key: GroupConstants.kListingName as NSCopying)
        mutableDict.setObjectOrNone(self.website as AnyObject?, key: GroupConstants.kWebsite as NSCopying)
        mutableDict.setObjectOrNone(self.city as AnyObject?, key: GroupConstants.kCity as NSCopying)
        mutableDict.setObjectOrNone(self.lat as AnyObject?, key: GroupConstants.kLat as NSCopying)
        mutableDict.setObjectOrNone(self.lng as AnyObject?, key: GroupConstants.kLng as NSCopying)
        
        return mutableDict
    }
}
