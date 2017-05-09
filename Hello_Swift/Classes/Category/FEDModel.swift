//
//  FEDModel.swift
//  Hello_Swift
//
//  Created by CW on 2017/3/12.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class FEDModel: NSObject {
    var cover_image_url:String?
    var title:String?
    var content_url:String?
    
    init(dict:[String:AnyObject]) {
        super.init()
        cover_image_url = dict["cover_image_url"] as? String
        title = dict["title"] as? String
        content_url = dict["content_url"] as? String
    }
}
