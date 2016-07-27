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

    let fail = false

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        recordMode = false
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testRestaurantsList() {
        let brazos = YLPBusiness()
        brazos.name = "Brazos Tacos"
        brazos.snippetText = "Authentic Texas breakfast tacos - highly recommend for those who've been to Austin! We were blown away by the \"I Love You so Much\" taco."


        let bebedero = YLPBusiness()
        bebedero.name = "The Bebedero"
        bebedero.snippetText = "A great new spot downtown with a cute little patio, too! We were a bit blinded by the sun, and our waitress helped us maneuver our umbrella so we were blind..."

        let state: AppState
        if !fail {
            state = AppState(restaurants: [brazos, bebedero], currentRestaurant: brazos)

        } else {
            state = AppState(restaurants: [brazos], currentRestaurant: brazos)
        }

        let window: UIWindow!

        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("RestaurantTableViewController") as! RestaurantsTableViewController
        UIApplication.sharedApplication().keyWindow?.rootViewController = UINavigationController(rootViewController: controller)
        controller.loadViewIfNeeded()
        window = UIApplication.sharedApplication().keyWindow

        controller.newState(state)

        FBSnapshotVerifyView(window)
    }


    func testRestaurantDetail() {
        let brazos = YLPBusiness()
        brazos.name = "Brazos Tacos"

        if !fail {
            brazos.snippetText = "Authentic Texas breakfast tacos - highly recommend for those who've been to Austin! We were blown away by the \"I Love You so Much\" taco."
        } else {
           brazos.snippetText = "Here is an incorrect state"
        }

        let state = AppState(restaurants: [], currentRestaurant: brazos)

        let window: UIWindow!

        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("RestaurantDetailViewController") as! RestaurantDetailViewController
        UIApplication.sharedApplication().keyWindow?.rootViewController = UINavigationController(rootViewController: controller)
        controller.loadViewIfNeeded()
        window = UIApplication.sharedApplication().keyWindow

        controller.newState(state)

        FBSnapshotVerifyView(window)
    }
}
