//
//  RecipeCard.swift
//  SaborDeCasa
//
//  Created by Ingrid Betancourt on 4/22/24.
//

import UIKit

class RecipeCard: UICollectionViewCell {
    
    //
    @IBOutlet weak var recipeImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var recipe: Recipe!
    
    func configure(with recipe: Recipe) {
        self.recipe = recipe
        
        update(with: recipe)
  
            // Set other properties of the recipe card using recipe data
        }
    
    private func update(with recipe: Recipe) {
        // 1.
        nameLabel.text = recipe.recipeName
    }
    
}
