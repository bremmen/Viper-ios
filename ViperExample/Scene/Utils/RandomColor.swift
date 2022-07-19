//
//  RandomColor.swift
//  ViperExample
//
//  Created by Bruno Fontes on 7/2/22.
//

import UIKit

struct RandomColor {
    static func getColor() -> UIColor {
        var color: UIColor = .white
        let randomInt = Int.random(in: 0..<4)
        switch randomInt {
        case 0:
            color = (.appCyan ?? .white)
        case 1:
            color = (.appGold ?? .white)
        case 2:
            color = (.appPink ?? .white)
        case 3:
            color = (.appRed ?? .white)
        default:
            color = (.appRed ?? .white)
        }
        return color
    }
}
