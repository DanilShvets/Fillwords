//
//  UIColorExtension.swift
//  Fillwords
//
//  Created by Данил Швец on 06.05.2023.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0.4...1),
            green: .random(in: 0.4...1),
            blue: .random(in: 0.4...1),
            alpha: 0.7
        )
    }
}
