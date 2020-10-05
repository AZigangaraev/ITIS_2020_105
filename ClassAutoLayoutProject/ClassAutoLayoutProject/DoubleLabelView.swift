//
//  DoubleLabelView.swift
//  ClassAutoLayoutProject
//
//  Created by Amir Zigangaraev on 05.10.2020.
//

import UIKit

class DoubleLabelView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.text = "Title"
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "Subtitle"
        return label
    }()
    
    private func setup() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = bounds.size
        
        titleLabel.frame = CGRect(
            x: 0, y: 0,
            width: size.width,
            height: size.height * 0.6
        )
        subtitleLabel.frame = CGRect(
            x: 0,
            y: size.height * 0.6,
            width: size.width,
            height: size.height * 0.4
        )
    }
    
    override var intrinsicContentSize: CGSize {
        let width: CGFloat
        if bounds.size.width == 0 {
            width = max(
                titleLabel.intrinsicContentSize.width,
                subtitleLabel.intrinsicContentSize.width
            )
        } else {
            width = bounds.size.width
        }
        return CGSize(
            width: width,
            height: titleLabel.intrinsicContentSize.height
                + subtitleLabel.intrinsicContentSize.height
        )
    }
}
