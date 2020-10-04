import UIKit

extension UIView {
    class func instantiateFromSameNamedNib() -> Self {
        let name = String(describing: self)
        guard let view = UINib(nibName: name, bundle: nil).instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("Could not instantiate \(name) from nib")
        }

        return view
    }
}
