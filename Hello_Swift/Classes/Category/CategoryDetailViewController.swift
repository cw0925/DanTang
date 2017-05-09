//
//  CategoryDetailViewController.swift
//  Hello_Swift
//
//  Created by CW on 2017/3/12.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit
import SwiftyJSON

let CDCellID = "categoryDCell"

class CategoryDetailViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {

    var model:FLModel?
    var CTable = UITableView()
    var items = [FEDModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        super.setupNavigation(title: (model?.name)!, leftTitle: "返回")
        initUI()
        requestFLDetailData()
    }
    func initUI() {
        automaticallyAdjustsScrollViewInsets = false
        let CTable = UITableView(frame:CGRect(x:0, y:20, width:view.frame.size.width,height: view.frame.size.height-20),style:UITableViewStyle.grouped)
        CTable.backgroundColor = UIColor.white
        CTable.separatorStyle = UITableViewCellSeparatorStyle.none
        CTable.dataSource = self
        CTable.delegate = self
        CTable.rowHeight = 200
        view.addSubview(CTable)
        let nib = UINib(nibName:"CDetailCell",bundle:nil)
        CTable.register(nib, forCellReuseIdentifier: CDCellID)
        self.CTable = CTable
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CDCellID, for: indexPath) as! CDetailCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        //cell.textLabel?.text = "哈哈哈"
        cell.cDetailItem = items[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = FLDetailViewController()
        detail.model = items[indexPath.row]
        self.navigationController!.pushViewController(detail, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func requestFLDetailData() {
        let urlStr = "http://api.dantangapp.com/v1/channels/\((model?.ID)!)/items?limit=20&offset=0"
        print(urlStr)
        NetRequestTool.shareNetTool.netRequestData(url: urlStr, success: { (response) in
            print(response)
            let dict = JSON(response)
            if let data = dict["data"].dictionary{
                if let itemArr = data["items"]?.arrayObject{
                    for item in itemArr{
                        let model = FEDModel(dict:item as![String:AnyObject])
                        self.items.append(model)
                    }
                }
            }
            self.CTable.reloadData()
        }) { (error) in
            
        }
        
    }

}
