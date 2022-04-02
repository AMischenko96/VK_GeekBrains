//
//  FriendsListCell.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 13.03.2022.
//

import UIKit

class FriendsListCell: UITableViewCell {

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendIcon: TestView!

    func configure(model: FriendModel) {
        friendName.text = model.name
        guard let image = UIImage(named: model.image) else { return }
        friendIcon.image = image
    }
}
