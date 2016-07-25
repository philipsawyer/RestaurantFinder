//
//  Reducer.swift
//  RestaurantFinder
//
//  Created by Philip Sawyer on 7/25/16.
//  Copyright © 2016 Philip Sawyer. All rights reserved.
//

import Foundation
import ReSwift

struct AppReducer: Reducer {
    func handleAction(action: Action, state: AppState?) -> AppState {
        return restaurantReducer(action, state: state)
    }
}

func restaurantReducer(action: Action, state: AppState?) -> AppState {
    guard let action = action as? RestaurantAction, var appState = state else {
        return AppState()
    }

    switch action {
    case .setCurrentRestaurant(let restaurant):
        appState.currentRestaurant = restaurant
    case .setRestaurants(let restaurants):
        appState.restaurants = restaurants
    }

    return appState
}