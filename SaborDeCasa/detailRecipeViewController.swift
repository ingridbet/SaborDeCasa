//
//  detailRecipeViewController.swift
//  SaborDeCasa
//
//  Created by Ingrid Betancourt on 4/22/24.
//

import UIKit

class detailRecipeViewController: UIViewController {

    @IBOutlet weak var recipeImageView: UIImageView!
    var recipe: Recipe!

    @IBOutlet weak var recipeNmLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var decriptionTextView: UITextView!
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    @IBOutlet weak var directionsTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        recipeNmLabel.text = recipe.recipeName
        categoryLabel.text = recipe.categoryText
        decriptionTextView.text = recipe.descriptions
        ingredientsTextView.text = recipe.ingredients
        directionsTextView.text = recipe.directions
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
