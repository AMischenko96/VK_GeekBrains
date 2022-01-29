//
//  NewsTableViewCell.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 31.12.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var newsPhoto: UIImageView!
}
