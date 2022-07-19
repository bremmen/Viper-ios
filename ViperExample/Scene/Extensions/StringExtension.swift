//
//  StringExtension.swift
//  ViperExample
//
//  Created by Bruno Fontes on 20/2/22.
//

import Foundation

extension String {

    func removeHtmlTag() -> String {
        var text = self.replacingOccurrences(of: "<p>", with: "")
        text = text.replacingOccurrences(of: "</p>", with: "")
        text = text.replacingOccurrences(of: "<br />", with: "")
        return text
    }
}
