//
//  LikeButton.swift
//  Post
//
//  Created by Robert Mukhtarov on 11.10.2020.
//

import UIKit

class LikeButton: UIButton {
    var isPressed: Bool = false {
        didSet { adjustAppearance() }
    }
    
    private func adjustAppearance() {
        if isPressed {
            setImage(.heartFill, for: .normal)
            tintColor = .red
        } else {
            setImage(.heart, for: .normal)
            tintColor = .vkGray
        }
    }
}

// MARK: - Extensions

extension UIImage {
    static let heart = UIImage(systemName: "heart", withConfiguration: .heartImageConfig)
    static let heartFill = UIImage(systemName: "heart.fill", withConfiguration: .heartImageConfig)
}

extension UIImage.Configuration {
    static let heartImageConfig = UIImage.SymbolConfiguration(pointSize: 25, weight: .medium, scale: .unspecified)
}

extension UIColor {
    static let vkGray = UIColor(named: "vk_gray")
}

