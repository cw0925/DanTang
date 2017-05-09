//
//  CDetailCell.swift
//  Hello_Swift
//
//  Created by CW on 2017/3/12.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class CDetailCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    var cDetailItem: FEDModel? {
        didSet {
            title.text = cDetailItem?.title
            let url = URL(string:(cDetailItem?.cover_image_url)!)
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
