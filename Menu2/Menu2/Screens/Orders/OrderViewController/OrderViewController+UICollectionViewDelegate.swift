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
        if let newBooking = orderModel.createNewBooking() {
            editOrder(order: newBooking, type: .new)
        }
    }
    
    func didAddNewOrder() {
        // called when the "new order" button is pressed
        // - present a new vc
        // - create a new Order(NSManagedObject)
        
        // create a new order and associate with the shift
        if let newOrder = orderModel.createNewOrder() {
            editOrder(order: newOrder, type: .new)
        }
        
    }
    
    private func editOrder(order: Order, type: OrderType) {
        let splitViewController = OrderSplitViewController()
        let orderItemViewController = OrderItemsViewController(type: type)
        let masterViewController = UINavigationController()
        masterViewController.viewControllers = [orderItemViewController]
        let menuViewController = MenuViewController()
        splitViewController.viewControllers = [masterViewController, menuViewController]
        
        present(splitViewController, animated: true, completion: nil)
        
        menuViewController.delegate =  orderItemViewController
        
        
        let loadOrderModel = OrderItemsModel(order: order)
        orderItemViewController.itemModel = loadOrderModel
        orderItemViewController.delegate = self
        
    }
    
    func didSelectOrder(in section: String, at index: Int) {
        // called when an order is selected
        // - present a vc
        // - pass in the order object
        if let order = orderModel.getOrder(in: section, at: index) {
            editOrder(order: order, type: .existing)
        }
    }
    
    func didLongPressOrder(in section: String, at index: Int, cell: UICollectionViewCell) {
        let vc = OrderPopoverViewController(sourceView: cell)
        
        present(vc, animated: true, completion: nil)
    }
}


extension OrderViewController: OrderItemsViewControllerDelegate {
    func didFinishEditing(order: Order) {
        orderModel.insertNewOrderIntoDataSource(order: order)
        allOrdersCollectionView.reloadData()
    }
}
