//
//  OrderCollectionViewCell+DelegateFlowLayout.swift
//  Menu2
//
//  Created by Siyu Liu on 22/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import UIKit

extension OrderViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // if this is the header view
        if indexPath.row == 0 {
            return CGSize(width: view.frame.width, height: 60)
        }
        return CGSize(width: view.frame.width, height: preferredSectionHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 25, left: 0, bottom: 25, right: 0)
    }
    
}

// new vcs are instantiated by these functions
extension OrderViewController: OrderCellDalegate {
    func didAddNewBooking() {
    }
    
    func didAddNewOrder() {
        // called when the "new order" button is pressed
        // - present a new vc
        // - create a new Order(NSManagedObject)
        let splitViewController = OrderSplitViewController()
        let orderItemViewController = OrderItemsViewController()
        let masterViewController = UINavigationController()
        masterViewController.viewControllers = [orderItemViewController]
        let menuViewController = MenuViewController()
        splitViewController.viewControllers = [masterViewController, menuViewController]
        present(splitViewController, animated: true, completion: nil)
        
        // create a new order and associate with the shift
        if let newOrder = orderModel.createNewOrder() {
            let newOrderModel = OrderItemsModel(order: newOrder)
            orderItemViewController.itemModel = newOrderModel
        }
        
    }
    
    func didSelectOrder(in section: String, at index: Int) {
        // called when an order is selected
        // - present a vc
        // - pass in the order object
        let splitViewController = OrderSplitViewController()
        let orderItemViewController = OrderItemsViewController()
        let masterViewController = UINavigationController()
        masterViewController.viewControllers = [orderItemViewController]
        let menuViewController = MenuViewController()
        splitViewController.viewControllers = [masterViewController, menuViewController]
        present(splitViewController, animated: true, completion: nil)
        
        if let order = orderModel.getOrder(in: section, at: index) {
            let loadOrderModel = OrderItemsModel(order: order)
            orderItemViewController.itemModel = loadOrderModel
        }
    }
}


