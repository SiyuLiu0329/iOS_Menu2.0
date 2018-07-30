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
        // can use a genertic function later
        let fetchReqest: NSFetchRequest = Shift.fetchRequest()
        do {
            return try mainContext.fetch(fetchReqest)
        } catch {
            print("Error fetching menus.")
        }
        return nil
    }
}
