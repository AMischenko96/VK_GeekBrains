//
//  GroupCell.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 06.12.2021.
//

import UIKit

class GroupCell: UITableViewCell {
    
    @IBOutlet weak var avatarGroup: UIImageView!
    @IBOutlet weak var nameGroup: UILabel!
    
    func configure(name: String, avatar: UIImage) {
        nameGroup.text = name
        avatarGroup.image = avatar
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
