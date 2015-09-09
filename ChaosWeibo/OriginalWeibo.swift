//
//  OriginalWeibo.swift
//  ChaosWeibo
//
//  Created by Cam on 9/9/15.
//  Copyright © 2015 Cam. All rights reserved.
//

import Foundation
class OriginalWeibo: FCModel {
    //Weibo part information
    var createdTime:String?
    var id:Int64?
    var mid:Int64?
    var idstr:String?
    var text:String?
    var source:String?
    var favorited:Bool?
    var truncated:String?
    //    var in_reply_to_status_id:String?
    //    var in_reply_to_user_id:String?
    //    var in_reply_to_screen_name:String?
    var thumbnailPic:String?
    var bmiddlePic:String?
    var originalPic:String?
    var geo:NSDictionary?
    var user:NSDictionary?
    var retweetedStatus:NSDictionary?
    var repostsCount:Int?
    var commentsCount:Int?
    var attitudesCount:Int?
    //    var mlevel:Int?
    var visible:NSDictionary?
    var picIDs:NSDictionary?
    var ad:NSArray?
    
    //user part information
    var userID:Int64?
    var screenName:String?
    var name:String?
    var profileImageURL:String?
    var proifileURL:String?
}