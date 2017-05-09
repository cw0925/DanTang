//
//  FLDetailViewController.swift
//  Hello_Swift
//
//  Created by CW on 2017/3/12.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit
import WebKit

class FLDetailViewController: BaseViewController {

    var model:FEDModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigation(title: "攻略详情", leftTitle: "返回")
        initUI()
    }
    func initUI() {
        let web = WKWebView(frame:self.view.frame)
        let url = URL(string:(model?.content_url)!)
        let request = NSURLRequest(url:url!)
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
