//
//  MyViewController.swift
//  Hello_Swift
//
//  Created by cw on 17/2/27.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class MyViewController: BaseViewController {

    var headView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
        customNavigation()
    }
    func customNavigation() {
        self.navigationController?.navigationBar.isHidden = true

        let leftBtn = UIButton.init(type:.custom)
        leftBtn.frame = CGRect(x: 20, y:30, width: 25, height: 25)
        leftBtn.setImage(UIImage.init(named: "Me_message_20x20_"), for: .normal)
        leftBtn.addTarget(self, action:#selector(leftItemClick) , for: .touchUpInside)
        headView.addSubview(leftBtn)
        
        let rightBtn = UIButton.init(type:.custom)
        rightBtn.frame = CGRect(x:SCREENW-40, y:30, width: 25, height: 25)
        rightBtn.setImage(UIImage.init(named: "Me_settings_20x20_"), for: .normal)
        rightBtn.addTarget(self, action:#selector(rightItemClick) , for: .touchUpInside)
        headView.addSubview(rightBtn)
        
    }
    func leftItemClick() {
        
    }
    func rightItemClick() {
        
    }
    func initUI() {
        headView = UIView.init(frame: CGRect(x: 0, y:0, width: SCREENW, height: 250))
        //headView.backgroundColor = UIColor.red
        self.view.addSubview(headView)
        
        let headImg = UIImageView.init(frame: headView.frame)
        headImg.image = UIImage.init(named:"Me_ProfileBackground")
        headView.addSubview(headImg)
        
        let iconBtn = UIButton.init(type: .custom)
        iconBtn.frame = CGRect(x: 0, y:0, width: 80, height: 80)
        iconBtn.center = headView.center
        iconBtn.setImage(UIImage.init(named: "Me_AvatarPlaceholder_75x75_"), for: .normal)
        iconBtn.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
        headView.addSubview(iconBtn)
        
    }
    func loginClick() {
        let login = LoginViewController()
        let navc = BaseNavigationController.init(rootViewController: login)
        self.present(navc, animated: true) { 
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
