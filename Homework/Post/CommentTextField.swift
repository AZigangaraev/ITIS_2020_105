//
//  CommentTextField.swift
//  Post
//
//  Created by Robert Mukhtarov on 09.10.2020.
//

import UIKit

@IBDesignable class CommentTextField: UITextField {
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet { layer.borderWidth = borderWidth }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet { layer.borderColor = borderColor.cgColor }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet { layer.cornerRadius = cornerRadius }
    }
    
    @IBInspectable var padding: CGFloat = 0
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: padding, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        textRect(forBounds: bounds)
    }
    
}
