//
//  CategoryViewController.swift
//  Hello_Swift
//
//  Created by cw on 17/2/27.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit
import SwiftyJSON

let FLCellID = "FLCell"

class CategoryViewController: BaseViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{

    var collection:UICollectionView?
    var items = [AnyObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
        requestCategoryData()
    }
    func initUI() {
        //view.backgroundColor = RGBColor(r: 240, g: 240, b: 240, a: 1)
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame:view.bounds, collectionViewLayout:layout)
        layout.itemSize = CGSize(width:(SCREENW-20) / 4,height:(SCREENW-20) / 4+30)
        collection.backgroundColor = UIColor.white
        collection.delegate = self
        collection.dataSource = self
        view.addSubview(collection)
        collection.register(UINib(nibName:"CategoryCell",bundle:nil), forCellWithReuseIdentifier: FLCellID)
        //注册一个headView
//        collection .register(HeadView.classForCoder(), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "head")
        collection.register(UINib(nibName:"HeadView",bundle:nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "head")
        self.collection = collection
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.items.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items[section].count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FLCellID, for: indexPath) as! CategoryCell
        cell.backgroundColor = UIColor.white
        let  modelArr = items[indexPath.section] as! [FLModel]
        let model  =  modelArr[indexPath.item]
        cell.categoryItem = model
        
        return cell
    }
    //返回cell 上下左右的间距
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(5, 10, 5, 10)
    }
    //返回HeadView的宽高
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        
        return CGSize(width: SCREENW, height:50)
    }
    //返回自定义HeadView或者FootView，我这里以headview为例
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        let arr = ["风格","品类"]
        var v = HeadView()
        if kind == UICollectionElementKindSectionHeader{
            
            v = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "head", for: indexPath as IndexPath) as! HeadView
        }
        v.title.text = arr[indexPath.section]
        return v
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = CategoryDetailViewController()
        detail.model = (items[indexPath.section] as! [FLModel])[indexPath.item]
        detail.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(detail, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func requestCategoryData() {
        let urlStr = "http://api.dantangapp.com/v1/channel_groups/all"
        
        NetRequestTool.shareNetTool.netRequestData(url: urlStr, success: { (response) in
            let dict = JSON(response)
            if let data = dict["data"].dictionary {
                if let channel_groups = data["channel_groups"]?.arrayObject {
                    // outGroups 存储两个 inGroups 数组，inGroups 存储 YMGroup 对象
                    // outGroups 是一个二维数组
                    for channel_group in channel_groups {
                        var inGroups = [FLModel]()
                        let channels = (channel_group as! NSDictionary)["channels"] as! [AnyObject]
                        for channel in channels {
                            let group = FLModel(dict: channel as! [String: AnyObject])
                            inGroups.append(group)
                        }
                        self.items.append(inGroups as AnyObject)
                    }
                    self.collection?.reloadData()
                }
            }
        }) { (error) in
            print(error)
        }
    }

}
