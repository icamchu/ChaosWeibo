//
//  Weibo.swift
//  ChaosWeibo
//
//  Created by Cam on 9/9/15.
//  Copyright © 2015 Cam. All rights reserved.
//

import Foundation
class Weibo: FCModel {
    var createdTime:NSDate?
    var id:Int?
    var mid:Int?
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
    
    
    
}