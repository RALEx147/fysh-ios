//
//  UIButtonExtension.swift
//  fysh-ios
//
//  Created by Robert Alexander on 10/11/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit

//Creates a specific color and size for the images that are used as buttons in the application.
extension UIColor {
    
    //Makes sure all images that are used as buttons are uniformly formatted and sized.
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

//Specifies the color of the UIButtons included in the application.
extension UIButton {
    func setBackground(_ color: UIColor, for state: UIControl.State) {
        setBackgroundImage(color.createOnePixelImage(), for: state)
    }
}
