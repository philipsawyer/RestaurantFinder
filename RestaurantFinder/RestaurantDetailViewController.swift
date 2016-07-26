//
//  RestaurantDetailViewController.swift
//  RestaurantFinder
//
//  Created by Philip Sawyer on 7/26/16.
//  Copyright © 2016 Philip Sawyer. All rights reserved.
//

import Foundation
import ReSwift
import YelpAPI

class RestaurantDetailViewController: UIViewController, StoreSubscriber {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!

    var currentRestaurant: YLPBusiness?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        mainStore.subscribe(self)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        mainStore.unsubscribe(self)
    }

    func newState(state: AppState) {
        //print("newState: \(state)")

        title = state.currentRestaurant?.name
        nameLabel.text = state.currentRestaurant?.name
        descriptionTextView.text = state.currentRestaurant?.snippetText
    }
}
