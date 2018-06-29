//
//  CoredataUtils+Shifts.swift
//  Menu2
//
//  Created by Siyu Liu on 29/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import Foundation
import CoreData

extension CoredataUtils {
    static func fetchShifts() -> [Shift]? {
        let fetchReqest: NSFetchRequest = Shift.fetchRequest()
        do {
            return try context.fetch(fetchReqest)
        } catch {
            print("Error fetching menus.")
        }
        return nil
    }
}
