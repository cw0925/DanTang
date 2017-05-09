//
//  TargetModel.swift
//  Hello_Swift
//
//  Created by cw on 17/3/13.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class TargetModel: NSObject {
    var title:String?
    var ID:Int?
    
    init(dict:[String:AnyObject]) {
        super.init()
        title = dict["title"] as? String
        ID = dict["id"] as? Int
    }
}
