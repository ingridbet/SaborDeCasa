//
//  detailRecipeViewController.swift
//  SaborDeCasa
//
//  Created by Ingrid Betancourt on 4/22/24.
//

import UIKit

class detailRecipeViewController: UIViewController {


    @IBOutlet weak var recipeNmLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var ingredientsTextView: UITextView!
    
    @IBOutlet weak var directionsTextView: UITextView!
    
    
    var recipe: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add edit button to the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editRecipe))
            
        // Do any additional setup after loading the view.
        
        if let recipe = recipe {
            recipeNmLabel.text = recipe.recipeName
            categoryLabel.text = recipe.categoryText
            descriptionTextView.text = recipe.descriptions
            ingredientsTextView.text = recipe.ingredients
            directionsTextView.text = recipe.directions
          } else {
              // Handle the case where recipe is nil
              print("Recipe is nil")
          }
    
        
    }
    @objc func editRecipe() {
        guard let recipeToEdit = recipe else {
            return
        }
        
        // Instantiate the RecipeComposeViewController
        let composeVC = storyboard?.instantiateViewController(withIdentifier: "RecipeComposeViewController") as! RecipeComposeViewController
        
        composeVC.isEditMode = true
        // Pass the recipe to be edited
        composeVC.recipeToEdit = recipeToEdit
        
        // Present the RecipeComposeViewController for editing
        navigationController?.pushViewController(composeVC, animated: true)
    }
    
    private func refreshRecipes() {
        let recipes = Recipe.getRecipes()
        // Assuming getRecipes() retrieves updated recipes from data source
        // Update the recipes array in SearchBarViewController
        if let searchBarViewController = navigationController?.viewControllers.first as? RecipeListViewController {
            searchBarViewController.recipes = recipes
            // Reload the collection view to reflect the changes
            searchBarViewController.collectionView.reloadData()
        }
    }

}
