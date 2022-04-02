//
//  MyGroupCell.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 13.03.2022.
//

import UIKit

final class MyGroupCell: UITableViewCell {
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupIcon: UIImageView!

    func configure(name: String, icon: UIImage) {
        groupName.text = name
        groupIcon.image = icon
    }
}
