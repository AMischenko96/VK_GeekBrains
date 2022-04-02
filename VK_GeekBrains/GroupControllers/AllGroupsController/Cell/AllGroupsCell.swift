//
//  AllGroupsCell.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 13.03.2022.
//

import UIKit

final class AllGroupsCell: UITableViewCell {

    @IBOutlet weak var nameGroup: UILabel!
    @IBOutlet weak var groupImage: TestView!

    func configure(name: String, icon: UIImage) {
        nameGroup.text = name
        groupImage.image = icon
    }
}
