//
//  UnitTests.swift
//  UnitTests
//
//  Created by Siyu Liu on 17/6/18.
//  Copyright © 2018 Siyu Liu. All rights reserved.
//

import XCTest
@testable import Menu2

class UnitTests: XCTestCase {
    let coredataUtils = CoredataUtils()
    
    override func setUp() {
        super.setUp()
        coredataUtils.deleteAllMenus()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        coredataUtils.deleteAllMenus()
    }
    
    func testDeleteMenus() {
        
        coredataUtils.addMenu(name: "Menu", decription: nil)
        coredataUtils.deleteAllMenus()
        let menus = coredataUtils.fetchAllMenus()!
        XCTAssertTrue(menus.count == 0)
    }
    
    func testAddMenu() {
        let expectedName = "Menu1"
        let expectedDescription = "Menu add unit test 1"
        coredataUtils.addMenu(name: expectedName, decription: expectedDescription)
        let menus = coredataUtils.fetchAllMenus()!
        XCTAssertTrue(menus[0].name == expectedName)
        XCTAssertTrue(menus[0].menuDescription == expectedDescription)
        
        coredataUtils.deleteAllMenus()
        coredataUtils.addMenu(name: expectedName, decription: expectedDescription)
        coredataUtils.addMenu(name: expectedName, decription: expectedDescription)
        coredataUtils.addMenu(name: expectedName, decription: expectedDescription)
        coredataUtils.addMenu(name: expectedName, decription: expectedDescription)
        coredataUtils.addMenu(name: expectedName, decription: expectedDescription)
        let menus2 = coredataUtils.fetchAllMenus()!
        XCTAssertTrue(menus2.count == 5)
    }
    
    func testBackgroundAddMenu() {
       
        let expectedName = "Menu1"
        let expectedDescription = "Menu add unit test 1"
        coredataUtils.backgroundAddMenu(name: expectedName, description: expectedDescription, completion: nil)
        coredataUtils.backgroundAddMenu(name: expectedName, description: expectedDescription, completion: nil)
        coredataUtils.backgroundAddMenu(name: expectedName, description: expectedDescription) {
            let menus = self.coredataUtils.fetchAllMenus()!
            XCTAssertTrue(menus.count == 3)
            XCTAssertTrue(menus[0].name == expectedName)
            XCTAssertTrue(menus[0].menuDescription == expectedDescription)
        }
    }
    
}
