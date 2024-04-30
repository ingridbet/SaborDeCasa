//
//  CreateViewController.swift
//  SaborDeCasa
//
//  Created by Ingrid Betancourt on 4/21/24.
//

import UIKit

class CreateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        refreshTasks()
    }
    
    @IBAction func didTapNewRecipeButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ComposeSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1.
        if segue.identifier == "ComposeSegue" {
            // 2.
            // i.
            if let composeNavController = segue.destination as? UINavigationController,
                // ii.
               let composeViewController = composeNavController.topViewController as? RecipeComposeViewController {
                
                // 3.
                composeViewController.recipeToEdit = sender as? Recipe
                
                // 4.
                // i.
                // ii.
                composeViewController.onComposeRecipe = { [weak self] recipe in
                    recipe.save()
                    self?.refreshTasks()
                }
            }
        }
    }
    
    // Method to refresh tasks
       private func refreshTasks() {
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
