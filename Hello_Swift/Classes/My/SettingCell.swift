//
//  SettingCell.swift
//  Hello_Swift
//
//  Created by CW on 2017/5/10.
//  Copyright © 2017年 CW. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {

    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(index:IndexPath) {
        if index.section==0 {
            let iconArr = ["more_icon_share_21x21_","more_icon_score_21x21_","more_icon_feedback_21x21_"]
            let titleArr = ["邀请好友使用单糖","给我们评分吧","意见反馈"]
            img.image = UIImage.init(named: iconArr[index.row])
            title.text = titleArr[index.row]
            detail.isHidden = true
            if index.row == 2 {
                self.accessoryType = .disclosureIndicator
            }
        }else if index.section == 1{
            let iconArr = ["more_icon_recommended_21x21_","more_icon_notification_21x21_","more_icon_clear_21x21_"]
            let titleArr = ["我的身份","接收消息提醒","清除缓存"]
            img.image = UIImage.init(named: iconArr[index.row])
            title.text = titleArr[index.row]
            if index.row == 0 {
                detail.text = "职场新人"
                self.accessoryType = .disclosureIndicator
            }else{
                detail.isHidden = true
            }
        }else{
            img.image = UIImage.init(named: "more_icon_about_21x21_")
            title.text = "关于单糖"
            self.accessoryType = .disclosureIndicator
            detail.isHidden = true
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
