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
    static let tableViewHeaderBackgroundColour = UIColor(red: 241/255, green: 241/255, blue: 242/255, alpha: 1)
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

extension UIView {
    func addDropShadow(offset: CGSize, radius: CGFloat, opacity: Float) {
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        
    }
}

extension UILabel {
    
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        let lines = Int(textSize.height/charSize)
        return lines
    }
    
}

extension Double {
    func toPrice() -> String {
        return String(format: "$%.2f", self)
    }
}
