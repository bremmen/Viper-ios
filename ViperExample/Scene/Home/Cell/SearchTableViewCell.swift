//
//  SearchTableViewCell.swift
//  ViperExample
//
//  Created by Bruno Fontes on 31/3/22.
//

import UIKit

class SearchTableViewCell: UITableViewCell, NibLoadableView {

    @IBOutlet weak var searchTextField: UITextField! {
        didSet {
            searchTextField.layer.borderColor = UIColor.white.cgColor
            searchTextField.layer.borderWidth = 1
            searchTextField.layer.cornerRadius = 10
            searchTextField.textColor = .appCyan
            searchTextField.attributedPlaceholder =  NSAttributedString(
                string: "Search game",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
            )
            searchTextField.delegate = self
        }
    }
}

extension SearchTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return false
    }
}
