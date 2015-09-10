//
//  GroceryInterfaceController.swift
//  SousChef
//
//  Created by Joe Lucero on 9/4/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import WatchKit
import Foundation
import SousChefKit

class GroceryInterfaceController: WKInterfaceController {
  @IBOutlet weak var table: WKInterfaceTable!
  let groceryList = GroceryList(useSample: true)
  
  lazy var flatList: [FlatGroceryItem] = {
    return self.groceryList.flattenedGroceries()
  }()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
      
      table.setNumberOfRows(3, withRowType: "GroceryTypeRow")
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
