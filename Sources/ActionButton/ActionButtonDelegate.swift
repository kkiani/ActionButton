#if !os(macOS)
import UIKit

public protocol ActionButtonDelegate {
    func actionButton(_ actionButton: ActionButton, didSelectRow index: Int)
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
}
#endif
