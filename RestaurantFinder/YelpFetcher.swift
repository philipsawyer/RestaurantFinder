//
//  YelpFetcher.swift
//  RestaurantFinder
//
//  Created by Philip Sawyer on 7/25/16.
//  Copyright © 2016 Philip Sawyer. All rights reserved.
//

import Foundation
import ReSwift
import YelpAPI

func fetchRestaurants(state: AppState, store: Store<AppState>) -> Action? {

    let yelp = YLPClient(consumerKey: key, consumerSecret: consumer_secret, token: token, tokenSecret: token_secret)

    let query = YLPQuery(location: "Charlottesville", currentLatLong: nil)
    query.term = "tacos"
    yelp.searchWithQuery(query) { (results, error) in
        for business in (results?.businesses)! {
            print("results: \(business.name)")
        }
        print("error: \(error)")
    }

    return nil
}