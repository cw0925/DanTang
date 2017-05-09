//
//  CategoryCell.swift
//  Hello_Swift
//
//  Created by CW on 2017/3/12.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!

    @IBOutlet weak var name: UILabel!
    
    var categoryItem: FLModel? {
        didSet {
            name.text = categoryItem?.name
            let url = URL(string:(categoryItem?.icon_url)!)
            img.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(1))], progressBlock: { (receivedSize, totalSize) in
                //print("\(indexPath.row + 1): \(receivedSize)/\(totalSize)")
            }) { (image, error, cacheType, imageURL) in
                //print("\(indexPath.row + 1): Finished")
            }
            
        }
    }
//    func configCell(categoryItem:FLModel) {
//        name.text = categoryItem.name
//        let url = URL(string:(categoryItem.icon_url)!)
//        img.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(1))], progressBlock: { (receivedSize, totalSize) in
//            //print("\(indexPath.row + 1): \(receivedSize)/\(totalSize)")
//        }) { (image, error, cacheType, imageURL) in
//            //print("\(indexPath.row + 1): Finished")
//        }
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
