//
//  HomeModel.swift
//  Hello_Swift
//
//  Created by cw on 17/3/7.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class HomeModel: NSObject {
    var cover_image_url:String?
    var title:String?
    var created_at:Int?
    var content_url:String?
    
    init(dict:[String:AnyObject]) {
        super.init()
        content_url = dict["content_url"] as? String
        cover_image_url = dict["cover_image_url"] as?String
        title = dict["title"] as? String
        created_at = dict["created_at"] as? Int
    }
}
