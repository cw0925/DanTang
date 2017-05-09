//
//  FLModel.swift
//  Hello_Swift
//
//  Created by CW on 2017/3/12.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class FLModel: NSObject {
    var icon_url:String?
    var name:String?
    var ID:Int?
    
    init(dict:[String:AnyObject]) {
        super.init()
        icon_url = dict["icon_url"] as? String
        name = dict["name"] as? String
        ID = dict["id"] as?Int
    }
}
