//
//  ScrollDetailViewController.swift
//  Hello_Swift
//
//  Created by cw on 17/3/13.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class ScrollDetailViewController: BaseViewController {

    var item:TargetModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigation(title: (item?.title)!, leftTitle: "返回")
        initUI()
        requestScrollDetailData(type: (item?.ID)!)
}
    func initUI() {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func requestScrollDetailData(type:Int) {
        let urlStr = "http://api.dantangapp.com/v1/collections/\(type)/posts"
        NetRequestTool.shareNetTool.netRequestData(url: urlStr, success: { (response) in
            print(response)
        }) { (error) in
            print(error)
        }
    }
}
