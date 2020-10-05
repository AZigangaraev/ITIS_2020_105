//
//  ViewController.swift
//  ClassAutoLayoutProject
//
//  Created by Amir Zigangaraev on 05.10.2020.
//

import UIKit

extension UIView {
    func adjustedForAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

