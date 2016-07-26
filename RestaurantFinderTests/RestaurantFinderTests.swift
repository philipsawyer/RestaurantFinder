//
//  RestaurantFinderTests.swift
//  RestaurantFinderTests
//
//  Created by Philip Sawyer on 7/25/16.
//  Copyright © 2016 Philip Sawyer. All rights reserved.
//

import XCTest
import FBSnapshotTestCase
import YelpAPI

@testable import RestaurantFinder

class RestaurantFinderTests: FBSnapshotTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testRestaurantsTableView() {

        recordMode = true
        let temp = YLPBusiness()
        temp.name = "Brazos Tacos"
        temp.snippetText = "Authentic Texas breakfast tacos - highly recommend for those who've been to Austin! We were blown away by the \"I Love You so Much\" taco."
        let state = AppState(restaurants: [temp], currentRestaurant: temp)

        let window: UIWindow!

        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("RestaurantTableViewController") as! RestaurantsTableViewController
        UIApplication.sharedApplication().keyWindow?.rootViewController = UINavigationController(rootViewController: controller)
        controller.loadViewIfNeeded()
        window = UIApplication.sharedApplication().keyWindow

        controller.newState(state)

        FBSnapshotVerifyView(window)
    }
    
}
