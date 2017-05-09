//
//  DanTangCell.swift
//  Hello_Swift
//
//  Created by cw on 17/3/2.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit
import Kingfisher

class DanTangCell: UITableViewCell {
    @IBOutlet weak var imv: UIImageView!
    @IBOutlet weak var desc: UILabel!
    
    var homeItem: HomeModel? {
        didSet {
            desc.text = homeItem?.title
            let url = URL(string:(homeItem?.cover_image_url)!)
            imv.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(1))], progressBlock: { (receivedSize, totalSize) in
                 //print("\(indexPath.row + 1): \(receivedSize)/\(totalSize)")
            }) { (image, error, cacheType, imageURL) in
                //print("\(indexPath.row + 1): Finished")
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //desc.backgroundColor = UIColor(red: 192/255.0, green: 192/255.0, blue: 192/255.0, alpha: 0.5)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
