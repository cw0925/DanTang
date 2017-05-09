//
//  NetRequestTool.swift
//  Hello_Swift
//
//  Created by cw on 17/3/7.
//  Copyright © 2017年 CW. All rights reserved.
//
import Foundation
import UIKit
import Alamofire
//import SwiftyJSON

class NetRequestTool: NSObject {
    //单例
    static let shareNetTool = NetRequestTool()
    //首页数据
    func netRequestData(url:String, success : @escaping (_ response : [String : AnyObject])->(), failure : @escaping (_ error : Error)->()) {
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            //当请求后response是我们自定义的，这个变量用于接受服务器响应的信息
            //使用switch判断请求是否成功，也就是response的result
            switch response.result {
            case .success(let value):
                //当响应成功时，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
                //if let value = response.result.value as? [String: AnyObject] {
                success(value as! [String : AnyObject])
                //                    }
                //let json = JSON(value)
                //print(json)
                
            case .failure(let error):
                failure(error)
                print("error:\(error)")
            }
        }
    }
}
