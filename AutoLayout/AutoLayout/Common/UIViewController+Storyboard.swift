import UIKit

extension UIStoryboard {
    func instantiateWithSameNameIdentifier<T: UIViewController>() -> T {
        let identifier = String(describing: T.self)
        return instantiateViewController(identifier: identifier)
    }
}
