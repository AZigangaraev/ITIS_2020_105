import UIKit

@IBDesignable class UserImageView: UIImageView {
    
    @IBInspectable var round: Bool = true {
        didSet { adjustCornerRadius() }
    }
    
    private func adjustCornerRadius() {
        if round {
            clipsToBounds = true
            layer.cornerRadius = frame.width / 2
        } else {
            layer.cornerRadius = 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet { layer.borderWidth = borderWidth }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet { layer.borderColor = borderColor.cgColor }
    }
    
}
