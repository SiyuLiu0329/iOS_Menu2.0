//
//  Colours.swift
//  Menu2
//
//  Created by Siyu Liu on 19/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static let backgroundColourMain = UIColor.white
    static let themeColour = UIColor.init(red: 37/255, green: 64/255, blue: 110/255, alpha: 1)
    static let collectionViewBackgroundColour = UIColor(red: 247/255, green: 247/255, blue: 250/255, alpha: 1)
}

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat, inset: CGFloat) {
        let border = CALayer()
        
        switch edge {
        case .top:
            border.frame = CGRect(x: inset, y: 0, width: frame.width - inset * 2, height: thickness)
        case .bottom:
            border.frame = CGRect(x: inset, y: frame.height - thickness, width: frame.width - inset * 2, height: thickness)
        case .left:
            border.frame = CGRect(x: 0, y: inset, width: thickness, height: frame.height - inset * 2)
        case .right:
            border.frame = CGRect(x: frame.width - thickness, y: inset, width: thickness, height: frame.height - inset * 2)
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        addSublayer(border)
    }
}


