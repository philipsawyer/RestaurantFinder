//
//  ViewController.swift
//  RestaurantFinder
//
//  Created by Philip Sawyer on 7/25/16.
//  Copyright © 2016 Philip Sawyer. All rights reserved.
//

import UIKit
import ReSwift

class RestaurantsTableViewController: UITableViewController, StoreSubscriber {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        mainStore.subscribe(self)

        mainStore.dispatch(fetchRestaurants)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        mainStore.unsubscribe(self)
    }

    func newState(state: AppState) {
        print("newState: \(state)")
    }
}

