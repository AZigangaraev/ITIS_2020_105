//
//  ViewController3.swift
//  ClassAutoLayoutProject
//
//  Created by Amir Zigangaraev on 05.10.2020.
//

import UIKit

class ViewController3: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doubleLabelView = DoubleLabelView()
        view.addSubview(doubleLabelView)
        doubleLabelView.translatesAutoresizingMaskIntoConstraints = false
        doubleLabelView
            .leadingAnchor
            .constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 20
            )
            .isActive = true
        doubleLabelView
            .topAnchor
            .constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20
            )
            .isActive = true
    }
}
