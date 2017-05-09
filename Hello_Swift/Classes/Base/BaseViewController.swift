//
//  BaseViewController.swift
//  Hello_Swift
//
//  Created by cw on 17/2/27.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
    }
    func setupNavigation(title:String,leftTitle:String){
        self.title = title
        let left = UIButton(type:.custom)
        left.frame = CGRect(x:0,y:0,width:40,height:30)
        left.setTitle(leftTitle, for: .normal)
        left.setTitleColor(UIColor.white, for: .normal)
        left.addTarget(self, action:#selector(tapClick(sender:)) , for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: left)
    }
    func tapClick(sender:UIButton){
        self.navigationController!.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
