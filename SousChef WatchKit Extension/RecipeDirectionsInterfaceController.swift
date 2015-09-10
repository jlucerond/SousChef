//
//  RecipeDirectionsInterfaceController.swift
//  SousChef
//
//  Created by Joe Lucero on 9/4/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import WatchKit
import Foundation
import SousChefKit

class RecipeDirectionsInterfaceController: WKInterfaceController {
  
  @IBOutlet weak var table: WKInterfaceTable!
  var recipe: Recipe?

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
      recipe = context as? Recipe
      
      if let steps = recipe?.steps{
        //set the number of rows in the table
        table.setNumberOfRows(steps.count, withRowType: "StepRow")
        
        for (index, step) in enumerate(steps){
          let controller = table.rowControllerAtIndex(index) as! StepRowController
          
          controller.stepLabel.setText("Step \(index+1)")
          controller.directionsLabel.setText(step)
        }
      }
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
