//
//  State.swift
//  RestaurantFinder
//
//  Created by Philip Sawyer on 7/25/16.
//  Copyright © 2016 Philip Sawyer. All rights reserved.
//

import Foundation
import ReSwift

var mainStore = Store<AppState>(reducer: AppReducer(), state: nil)

struct AppState: StateType {
    var restaurants: [Restaurant]?
    var currentRestaurant: Restaurant?
}