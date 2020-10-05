//
//  ViewController2.swift
//  ClassAutoLayoutProject
//
//  Created by Amir Zigangaraev on 05.10.2020.
//

import UIKit

class ViewController2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Write something here"
        view.addSubview(textField.adjustedForAutoLayout())
        
//        let leadingConstraint = NSLayoutConstraint(
//            item: textField,
//            attribute: .leading,
//            relatedBy: .greaterThanOrEqual,
//            toItem: view,
//            attribute: .leading,
//            multiplier: 1,
//            constant: 20
//        )
//        leadingConstraint.isActive = true
        
        // textfield.right >= view.right + 20
        view.trailingAnchor
            .constraint(
                greaterThanOrEqualTo: textField.trailingAnchor,
                constant: 20
            )
            .isActive = true
        
        let widthConstraint = NSLayoutConstraint(
            item: textField,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 300
        )
//        let widthConstraint =  textField.widthAnchor.constraint(equalTo: 300)
        widthConstraint.priority = .defaultHigh
        widthConstraint.isActive = true
        
        textField.topAnchor
            .constraint(equalTo: view.topAnchor, constant: 120)
            .isActive = true
        
        textField.centerXAnchor
            .constraint(equalTo: view.centerXAnchor)
            .isActive = true
    }
}
