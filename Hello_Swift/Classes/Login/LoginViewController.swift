//
//  LoginViewController.swift
//  Hello_Swift
//
//  Created by CW on 2017/4/1.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit
import SnapKit

let BTNWIDTH = ((SCREENW-50*4)/3)

class LoginViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupNavigation(title: "登录", leftTitle: "取消")
        initUI()
    }
    override func setupNavigation(title: String, leftTitle: String) {
        super.setupNavigation(title: title, leftTitle: leftTitle)
        let rightBtn = UIButton.init(type: .custom)
        rightBtn.frame = CGRect(x:0,y:0,width:40,height:30)
        rightBtn.setTitle("注册", for: .normal)
        rightBtn.addTarget(self, action: #selector(rightBarClick(sender:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightBtn)
    }
    override func tapClick(sender: UIButton) {
        self.dismiss(animated: true) { 
            
        }
    }
    func rightBarClick(sender:UIButton) {
        let registVC = RegistViewController()
        self.navigationController?.pushViewController(registVC, animated: true)
        
    }
    func initUI() {
        view.backgroundColor = RGBColor(r: 240, g: 240, b: 240, a: 1)
        
        let loginView = UIView.init(frame: CGRect(x:0,y:50+64,width:SCREENW,height:80))
        loginView.backgroundColor = UIColor.white
        view.addSubview(loginView)
        
        let phone = UITextField.init(frame: CGRect(x:10,y:0,width:SCREENW-20,height:40))
        phone.placeholder = "手机号"
        loginView.addSubview(phone)
        
        let line = UILabel.init(frame: CGRect(x:10,y:40,width:SCREENW-20,height:1))
        line.backgroundColor = RGBColor(r: 209, g: 209, b: 209, a: 1)
        loginView.addSubview(line)
        
        let password = UITextField.init(frame: CGRect(x:10,y:40,width:SCREENW-20,height:40))
        password.placeholder = "密码"
        loginView.addSubview(password)
        
        
        let login = UIButton.init(type: .custom)
        login.frame = CGRect(x:10,y:50+64+80+30,width:SCREENW-20,height:40)
        login.setTitle("登录", for: .normal)
        login.backgroundColor = RGBColor(r: 245, g: 80, b: 83, a: 1)
        login.layer.cornerRadius = 5
        login.layer.masksToBounds = true
        view.addSubview(login)
        
        let forget = UIButton.init(type: .custom)
        forget.frame = CGRect(x:SCREENW-80,y:50+64+80+30+40+5,width:70,height:30)
        forget.setTitle("忘记密码", for: .normal)
        forget.setTitleColor(RGBColor(r: 187, g: 187, b: 187, a: 1), for:.normal)
        forget.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(forget)
        
        let  tip = UIView.init(frame: CGRect(x:10,y:50+64+80+30+40+5+30+10,width:SCREENW-20,height:30))
        //tip.backgroundColor = UIColor.white
        view.addSubview(tip)
        
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12)
        title.text = "使用社交账号登录"
        //title.backgroundColor = RGBColor(r: 187, g: 187, b: 187, a: 1)
        title.textAlignment = .center
        tip.addSubview(title)
        
        title.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.center.equalTo(tip)
        }
        
        let desc_left = UILabel.init(frame: CGRect(x:0,y:15,width:(SCREENW-140)/2,height:1))
        desc_left.backgroundColor = RGBColor(r: 187, g: 187, b: 187, a: 1)
        tip.addSubview(desc_left)
       
        
        let desc_right = UILabel.init(frame: CGRect(x:SCREENW/2+50,y:15,width:(SCREENW-140)/2,height:1))
        desc_right.backgroundColor = RGBColor(r: 187, g: 187, b: 187, a: 1)
        tip.addSubview(desc_right)
        
        let imgName = ["icon_log_sina_63x63_","icon_log_wechat_63x63_","icon_log_qq_63x63_"]
        
        //CGFloat 和 int 不能直接运算
        for i in 0..<3 {
            let  btn = UIButton.init(type: .custom)
            btn.frame = CGRect(x:(BTNWIDTH*CGFloat(Float(i))+50*(CGFloat(Float(i))+1)),y:50+64+80+30+40+5+30+10+30+20,width:BTNWIDTH,height:60)
            btn.setImage(UIImage.init(named: imgName[i]), for: .normal)
            view.addSubview(btn)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
