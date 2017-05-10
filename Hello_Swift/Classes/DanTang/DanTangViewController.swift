//
//  DanTangViewController.swift
//  Hello_Swift
//
//  Created by cw on 17/2/27.
//  Copyright © 2017 CW. All rights reserved.
//

import UIKit
import SwiftyJSON

let cellID = "DTCell"

class DanTangViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,CyclePictureViewDelegate{

    var DTTable = UITableView()
    /// 首页列表数据
    var items = [HomeModel]()
    var scrollItems = [ScrollModel]()
    var imageURLArray: [String] = []
    var targetItems = [TargetModel]()
    
    weak var loadingView:LoadingView!
    
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
        requestScrollViewData()
        requestHomeData()
        
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        self.DTTable.mj_header = header
        
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
        self.DTTable.tableFooterView = footer
        
    }
    // 顶部刷新
    func headerRefresh(){
        print("下拉刷新")
    }
    
    // 底部刷新
    var index = 0
    func footerRefresh(){
        print("上拉刷新")
    }
    func initScrollView(imageArr:[String]) {
        let cyclePictureView = CyclePictureView(frame: CGRect(x: 0, y:0, width: self.view.frame.width, height: 200), imageURLArray: nil)
        cyclePictureView.backgroundColor = UIColor.red
        cyclePictureView.imageURLArray = imageArr
        cyclePictureView.timeInterval = 4
        cyclePictureView.delegate = self
        self.DTTable.tableHeaderView = cyclePictureView
    }
    func cyclePictureView(_ cyclePictureView: CyclePictureView, didSelectItemAtIndexPath indexPath: IndexPath){
        let detail = ScrollDetailViewController()
        detail.hidesBottomBarWhenPushed = true
        detail.item = self.targetItems[indexPath.item]
        self.navigationController!.pushViewController(detail, animated: true)
    }
    func initUI()  {
        //automaticallyAdjustsScrollViewInsets = false
        let DTTable = UITableView(frame:view.bounds,style:UITableViewStyle.grouped)
        DTTable.backgroundColor = UIColor.white
        DTTable.separatorStyle = UITableViewCellSeparatorStyle.none
        DTTable.dataSource = self
        DTTable.delegate = self
        view.addSubview(DTTable)
        let nib = UINib(nibName:"DanTangCell",bundle:nil)
        DTTable.register(nib, forCellReuseIdentifier: cellID)
        self.DTTable = DTTable
        
        //self.DTTable.sectionHeaderHeight = 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! DanTangCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        if indexPath.row==0 {
            
        }
        cell.homeItem = items[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DTDetailViewController()
        detailVC.homeItem = items[indexPath.row]
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //列表数据
    func requestHomeData()  {
        let loadingView = LoadingView.showLoadingWith(view: view)
        self.loadingView = loadingView
        
        let urlStr = "http://api.dantangapp.com/v1/channels/4/items?gender=1&generation=1&limit=20&offset=0"
        NetRequestTool.shareNetTool.netRequestData(url: urlStr, success: { (response) in
            let dict = JSON(response)
            let data = dict["data"].dictionary
            //  字典转成模型
            if let itemArr = data!["items"]?.arrayObject {
                //var homeItems = [HomeModel]()
                for item in itemArr {
                    let homeItem = HomeModel(dict: item as! [String: AnyObject])
                    self.items.append(homeItem)
                }
                self.DTTable.reloadData()
                loadingView.hideLoadingView()
            }

        }) { (error) in
            print(error)
            //self.loading.hideloadingAnimation()
            loadingView.hideLoadingView()
        }
    }
    //轮播图数据
    func requestScrollViewData() {
        let urlStr = "http://api.dantangapp.com/v1/banners"
        NetRequestTool.shareNetTool.netRequestData(url: urlStr, success: { (response) in
            let dict = JSON(response)
            let data = dict["data"].dictionary
            if let itemArr = data?["banners"]?.arrayObject{
                for item in itemArr{
                    let scrollItem = ScrollModel(dict:item as! [String: AnyObject])
                    self.scrollItems.append(scrollItem)
                    
                    if let target = (item as! NSDictionary)["target"]{
                        let tagetItem = TargetModel(dict:target as![String: AnyObject])
                        self.targetItems.append(tagetItem)
                    }
                }
            }
            //轮播图数据
            for i in 0..<self.scrollItems.count{
                 self.imageURLArray.append(self.scrollItems[i].image_url! )
            }
            self.initScrollView(imageArr: self.imageURLArray)
        }) { (error) in
            print(error)
        }
        
        
    }
}
