//
//  MyGroupCell.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 09.12.2021.
//

import UIKit

class MyGroupCell: UITableViewCell {
    
    @IBOutlet weak var nameGroup: UILabel!
    @IBOutlet weak var avatarGroup: UIImageView!
    
    func configure(name: String, avatar: UIImage) {
        nameGroup.text = name
        avatarGroup.image = avatar
    }
}
