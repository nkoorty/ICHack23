import UIKit

extension UISearchTextField {
   var clearButton: UIButton? {
      return value(forKey: "_clearButton") as? UIButton
   }
}
