//
//  RestaurantsTableViewController.swift
//  RestaurantFinder
//
//  Created by Philip Sawyer on 7/25/16.
//  Copyright © 2016 Philip Sawyer. All rights reserved.
//

import UIKit
import ReSwift
import YelpAPI

class RestaurantsTableViewController: UITableViewController, StoreSubscriber {

    var restaurants: [YLPBusiness]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        title = "Restaurants"
        self.restaurants = []
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
        //print("newState: \(state)")

        restaurants = state.restaurants

        dispatch_async(dispatch_get_main_queue()) { 
            self.tableView.reloadData()
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = restaurants?[indexPath.row].name
        return cell
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants?.count ?? 0
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        mainStore.dispatch(RestaurantAction.setCurrentRestaurant(restaurants![indexPath.row]))
    }
}

