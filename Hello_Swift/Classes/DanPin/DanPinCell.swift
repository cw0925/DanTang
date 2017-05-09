//
//  DanPinCell.swift
//  Hello_Swift
//
//  Created by cw on 17/3/2.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class DanPinCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    var dpItem: DPModel? {
        didSet {
            name.text = dpItem?.name
            let url = URL(string:(dpItem?.cover_image_url)!)
            img.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(1))], progressBlock: { (receivedSize, totalSize) in
                //print("\(indexPath.row + 1): \(receivedSize)/\(totalSize)")
            }) { (image, error, cacheType, imageURL) in
                //print("\(indexPath.row + 1): Finished")
            }
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
