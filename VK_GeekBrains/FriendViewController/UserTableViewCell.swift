//
//  UserTableViewCell.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 07.12.2021.
//

import UIKit

class UserTableViewCell: UITableViewCell {

   
    @IBOutlet weak var nameFriend: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameFriend.text = ""
    }
    
    
    func setImg (img: UIImage) {
        
    }
}
