//
//  DTDetailViewController.swift
//  Hello_Swift
//
//  Created by cw on 17/3/7.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit
import WebKit

class DTDetailViewController: BaseViewController,WKUIDelegate {

    var homeItem:HomeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        super.setupNavigation(title: "攻略详情", leftTitle: "返回")
        initUI()
    }
    func initUI() {
        let web = WKWebView(frame:self.view.frame)
        let url = URL(string:(homeItem?.content_url)!)
        let request = NSURLRequest(url:url!)
        web.load(request as URLRequest)
        web.isUserInteractionEnabled = true
        web.uiDelegate = self
        self.view.addSubview(web)
        
    }
    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView?{
        if navigationAction.targetFrame == nil {
            let url = navigationAction.request.url
            if ((url?.description.lowercased().range(of: "http://")) != nil)||((url?.description.lowercased().range(of: "https://")) != nil)||((url?.description.lowercased().range(of: "mailto:")) != nil){
                let good  = GoodViewController()
                good.goodUrl = url
                self.navigationController?.pushViewController(good, animated: true)
            }
        }
        return nil
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
