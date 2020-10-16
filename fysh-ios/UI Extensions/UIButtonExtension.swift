//
//  UIButtonExtension.swift
//  fysh-ios
//
//  Created by Robert Alexander on 10/11/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit

extension UIColor {
    func createOnePixelImage() -> UIImage? {
        let size = CGSize(width: 1, height: 1)
        UIGraphicsBeginImageContext(size)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.setFillColor(cgColor)
        context.fill(CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

extension UIButton {
    func setBackground(_ color: UIColor, for state: UIControl.State) {
        setBackgroundImage(color.createOnePixelImage(), for: state)
    }
}
