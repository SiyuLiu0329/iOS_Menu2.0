//
//  SlideOutMenuTableViewCellViewModel.swift
//  Menu2
//
//  Created by Siyu Liu on 12/8/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

struct SlideOutMenuTableViewCellViewModel {
    let title: String
    let icon: UIImage
    
    init(title: String, icon: UIImage) {
        self.title = title
        self.icon = icon.withRenderingMode(.alwaysTemplate)
        
    }
}
