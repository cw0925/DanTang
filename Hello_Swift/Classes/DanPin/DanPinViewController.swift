//
//  DanPinViewController.swift
//  Hello_Swift
//
//  Created by cw on 17/2/27.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit
import SwiftyJSON

let  collectionID = "collectionCell"

class DanPinViewController: BaseViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    var collection: UICollectionView?
    var items = [DPModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
        requestDanPinData()
    }
    func initUI() {
        //automaticallyAdjustsScrollViewInsets = false
        
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame:view.bounds, collectionViewLayout:layout)
        layout.itemSize = CGSize(width:(SCREENW-20) / 2,height:165)
        collection.backgroundColor = UIColor.white
        collection.delegate = self
        collection.dataSource = self
        view.addSubview(collection)
        collection.register(UINib(nibName:"DanPinCell",bundle:nil), forCellWithReuseIdentifier: collectionID)
        self.collection = collection
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionID, for: indexPath) as! DanPinCell
        cell.dpItem = self.items[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detail = DPDViewController()
        detail.dpItem = self.items[indexPath.item]
        detail.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detail, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func requestDanPinData() {
        let urlStr = "http://api.dantangapp.com/v2/items?gender=1&generation=1&limit=20&offset=0"
        NetRequestTool.shareNetTool.netRequestData(url: urlStr, success: { (response) in
            print(response)
            let dict = JSON(response)
            if let data = dict["data"].dictionary {
                if let itemArr = data["items"]?.arrayObject {
                    for item in itemArr {
                        if let itemData = (item as! NSDictionary)["data"] {
                            let product = DPModel(dict: itemData as! [String: AnyObject])
                            self.items.append(product)
                        }
                    }
                    self.collection?.reloadData()
                }
            }
            
        }) { (error) in
            print(error)
        }
    }
}
