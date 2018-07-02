//
//  OrderItemTableViewHeaderView.swift
//  Menu2
//
//  Created by Siyu Liu on 1/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class OrderItemTableViewHeaderView: UITableViewHeaderFooterView {
    static let viewId = "tableViewHeaderView"
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a 'on' d-MMM"
        label.text = "Created " + dateFormatter.string(from: Date())
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    func setDate(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a 'on' d-MMM"
        dateLabel.text = "Created " + dateFormatter.string(from: Date())
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
