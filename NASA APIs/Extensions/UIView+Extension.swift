//
//  UIView+Extension.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 20.10.2022.
//

import Foundation
import UIKit

extension UIView {
    class func loadFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)?.first as! T
    }
}
