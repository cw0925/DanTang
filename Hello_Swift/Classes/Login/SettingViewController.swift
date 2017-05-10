//
//  SettingViewController.swift
//  Hello_Swift
//
//  Created by CW on 2017/5/10.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(false, animated: false)
        super.setupNavigation(title: "更多", leftTitle: "返回")
        initUI()
    }
    func initUI() {
        let setTable = UITableView.init(frame: view.bounds, style: .grouped)
        setTable.delegate = self
        setTable.dataSource = self
        view.addSubview(setTable)
        setTable.register(UINib(nibName:"SettingCell",bundle:nil), forCellReuseIdentifier: "setCell")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }else if section == 1{
            return 3
        }else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "setCell", for: indexPath) as! SettingCell
        cell.configCell(index: indexPath)
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
