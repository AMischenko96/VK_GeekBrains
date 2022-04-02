//
//  UserTableViewCell.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 06.12.2021.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameFriend: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameFriend.text = ""
    }
    
    
    func setImg (img: UIImage) {
        
    }

}
