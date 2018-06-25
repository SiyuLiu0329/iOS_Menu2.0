//
//  Section0CollectionViewCell.swift
//  Menu2
//
//  Created by Siyu Liu on 22/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import UIKit

protocol OrderCellDalegate: class {
    func didAddNewOrder()
    func didAddNewBooking()
}

class Section0CollectionViewCell: UICollectionViewCell {
    
    weak var delegate: OrderCellDalegate?

    lazy var newOrderView: UILabel = {
        let label = CreateOrderButton(frame: CGRect.zero)
        let recogniser = UITapGestureRecognizer(target: self, action: #selector(self.newOrderTapped))
        label.addGestureRecognizer(recogniser)
        return label
    }()
    
    lazy var newBookingView: UILabel = {
        let label = CreateOrderButton(frame: CGRect.zero)
        let recogniser = UITapGestureRecognizer(target: self, action: #selector(self.newBookingTapped))
        label.addGestureRecognizer(recogniser)
        return label
    }()
    
    @objc private func newOrderTapped() {
        if let delegate = delegate {
            delegate.didAddNewOrder()
        }
    }
    
    @objc private func newBookingTapped() {
        if let delegate = delegate {
            delegate.didAddNewBooking()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutSectionView()
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutSectionView() {
        newOrderView.text = "New Order"
        newBookingView.text = "New Booking"
        
        addSubview(newOrderView)
        NSLayoutConstraint.activate([
            newOrderView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            newOrderView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            newOrderView.widthAnchor.constraint(equalToConstant: 130),
            newOrderView.heightAnchor.constraint(equalToConstant: 50)])
        
        addSubview(newBookingView)
        NSLayoutConstraint.activate([
            newBookingView.leftAnchor.constraint(equalTo: newOrderView.rightAnchor, constant: 30),
            newBookingView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            newBookingView.widthAnchor.constraint(equalToConstant: 130),
            newBookingView.heightAnchor.constraint(equalToConstant: 50)])
    }
}

class CreateOrderButton: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.themeColour
        layer.cornerRadius = 10
        clipsToBounds = true
        textColor = .white
        font = UIFont.systemFont(ofSize: 18, weight: .light)
        textAlignment = .center
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
