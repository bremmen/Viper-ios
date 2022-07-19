//
//  NibLoadableView.swift
//  ViperExample
//
//  Created by Bruno Fontes on 6/2/22.
//

import UIKit

protocol NibLoadableView: AnyObject {}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: self.nibName, bundle: nil)
    }
}
