//
//  ScrollModel.swift
//  Hello_Swift
//
//  Created by cw on 17/3/13.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class ScrollModel: NSObject {
    var image_url:String?
    
    init(dict:[String:AnyObject]) {
        super.init()
        image_url = dict["image_url"] as? String
    }
}
