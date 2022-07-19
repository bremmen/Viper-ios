//
//  NibLoadable.swift
//  ViperExample
//
//  Created by Bruno Fontes on 6/2/22.
//

import UIKit

protocol NibLoadable: AnyObject {}

extension NibLoadable where Self: UIViewController {
    static var nibName: String {
        return String(describing: self)
    }
}
