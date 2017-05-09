//
//  Const.swift
//  Hello_Swift
//
//  Created by cw on 17/3/2.
//  Copyright © 2017年 CW. All rights reserved.
//

import Foundation
import UIKit
/// 屏幕的宽
let SCREENW = UIScreen.main.bounds.size.width
/// 屏幕的高
let SCREENH = UIScreen.main.bounds.size.height
/// RGBA的颜色设置
func RGBColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

		
