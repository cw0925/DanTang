//
//  DPModel.swift
//  Hello_Swift
//
//  Created by CW on 2017/3/8.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class DPModel: NSObject {
    var cover_image_url:String?
    var name:String?
    var url:String?
    
    init(dict:[String:AnyObject]) {
        super.init()
        cover_image_url = dict["cover_image_url"] as? String
        name = dict["name"] as? String
        url = dict["url"] as? String
    }
    
}
