//
//  RoundedPhoto.swift
//  VK_GeekBrains
//
//  Created by Анастасия Горина on 07.12.2021.
//

import UIKit

@IBDesignable class roundedImageView: UIImageView {

    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.masksToBounds = true
            layer.cornerRadius = cornerRadius
        }
        
    }
    
    
}
