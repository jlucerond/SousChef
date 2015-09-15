//
//  RecipeIngredientsInterfaceController.swift
//  SousChef
//
//  Created by Joe Lucero on 9/4/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import WatchKit
import Foundation
import SousChefKit

class RecipeIngredientsInterfaceController: WKInterfaceController {
  
  @IBOutlet weak var table: WKInterfaceTable!
  var recipe: Recipe?

  let groceryList = GroceryList()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
      
      recipe = context as? Recipe
      
      if let ingredients = recipe?.ingredients{
        //set the number of rows in the table
        table.setNumberOfRows(ingredients.count, withRowType: "IngredientRow")
        
        //do a for loop where I;
        for (index, ingredient) in enumerate(ingredients){
        
          let controller = table.rowControllerAtIndex(index)
            as! IngredientRowController
          
          controller.nameLabel.setText(ingredient.name.capitalizedString)
          controller.measurementLabel.setText(ingredient.quantity)
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
    
    //Menu Actions
    @IBAction func onAddToGrocery() {
      if let items = self.recipe?.ingredients {
        for item in items {
          groceryList.addItemToList(item)
        }
        groceryList.sync()
      }
    }

}
