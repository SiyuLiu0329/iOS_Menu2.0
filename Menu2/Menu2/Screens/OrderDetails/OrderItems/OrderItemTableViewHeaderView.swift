//
//  OrderItemTableViewHeaderView.swift
//  Menu2
//
//  Created by Siyu Liu on 1/7/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

class OrderItemTableViewHeaderView: UITableViewHeaderFooterView {
    //TODO: change this view to horizontal list of icons with actions!
    
    static let viewId = "tableViewHeaderView"
    
    /*
     An UILabel indicating when the order is created
     */
    var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    func setDate(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a 'on' d-MMM"
        dateLabel.text = "Created " + dateFormatter.string(from: date)
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
