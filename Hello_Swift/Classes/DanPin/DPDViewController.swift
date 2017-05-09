//
//  DPDViewController.swift
//  Hello_Swift
//
//  Created by CW on 2017/3/11.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit
import WebKit

class DPDViewController: BaseViewController {

    var dpItem:DPModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        super.setupNavigation(title: "商品详情", leftTitle: "返回")
        initUI()
    }
    func initUI() {
        let web = WKWebView(frame:self.view.frame)
        let urlStr = URL(string:(dpItem?.url)!)
        let request = NSURLRequest(url:urlStr!)
        web.load(request as URLRequest)
        self.view.addSubview(web)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
