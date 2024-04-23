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
                    //self?.refreshTasks()
                }
            }
        }
    }


}
