//
//  RecipeCard.swift
//  SaborDeCasa
//
//  Created by Ingrid Betancourt on 4/22/24.
//

import UIKit

class RecipeCard: UICollectionViewCell {
    
    //
  
    @IBOutlet weak var nameLabel: UILabel!
    
    var recipe: Recipe!
    
    func configure(with recipe: Recipe) {
        self.recipe = recipe
        nameLabel.text = recipe.recipeName
    }
    
}
