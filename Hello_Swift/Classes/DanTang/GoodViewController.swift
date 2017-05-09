//
//  GoodViewController.swift
//  Hello_Swift
//
//  Created by CW on 2017/3/13.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit
import WebKit

class GoodViewController: BaseViewController {

    var goodUrl:URL?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigation(title: "商品详情", leftTitle: "返回")
        initUI()
    }
    func initUI() {
        let web = WKWebView(frame:self.view.frame)
        let request = NSURLRequest(url:goodUrl!)
        web.load(request as URLRequest)
        self.view.addSubview(web)
    }
    override func setupNavigation(title: String, leftTitle: String) {
        super.setupNavigation(title: title, leftTitle: leftTitle)
        let right = UIButton()
        right.frame = CGRect(x:0,y:0,width:20,height:20)
        right.setBackgroundImage(UIImage.init(named: "baichuan_btn_share_21x21_"), for: .normal)
        right.addTarget(self, action:#selector(shareClick(sender:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: right)
    }
    //分享
    func shareClick(sender:UIButton) {
        // 1.创建分享参数
        let shareParames = NSMutableDictionary()
        
        shareParames.ssdkSetupShareParams(byText: "分享内容",
                                                images : UIImage(named: "shareImg.png"),
                                                url : goodUrl,
                                                title : "分享标题",
                                                type : SSDKContentType.webPage)
        ShareSDK.showShareActionSheet(nil, items:[
            SSDKPlatformType.typeSinaWeibo.rawValue,SSDKPlatformType.subTypeWechatTimeline.rawValue,SSDKPlatformType.subTypeQZone.rawValue,SSDKPlatformType.typeQQ.rawValue,SSDKPlatformType.typeWechat.rawValue,SSDKPlatformType.subTypeQQFriend.rawValue,SSDKPlatformType.subTypeWechatSession.rawValue], shareParams: shareParames) { (state, plateType, userData, contentEntity, error, true) in
                switch state{
                case SSDKResponseState.success:
                    print("分享成功")
                    let alertController = UIAlertController(title: "提示",
                                                            message: "分享成功", preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                    let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                        action in
                        print("点击了确定")
                    })
                    alertController.addAction(cancelAction)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                case SSDKResponseState.fail:
                    print("分享失败,错误描述:\(error)")
                    let alertController = UIAlertController(title: "提示",
                                                            message: "分享失败", preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                    let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                        action in
                        print("点击了确定")
                    })
                    alertController.addAction(cancelAction)
                    alertController.addAction(okAction)
                    self.present(alertController, animated: true, completion: nil)
                default:
                    break
                }
        }
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
