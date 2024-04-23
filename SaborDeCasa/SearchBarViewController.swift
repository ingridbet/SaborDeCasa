//
//  ViewController.swift
//  SaborDeCasa
//
//  Created by Ingrid Betancourt on 4/15/24.
//

import UIKit

class SearchBarViewController: UIViewController {
    
    //CollectionView Outlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // The array of all recipes to display.
    var recipes: [Recipe] = []
    
    let searchController = UISearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        
        print("✅ We got \(recipes.count) Recipes!")
        
        print("✅ We got \(recipes) recipes!")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Check if the segue's destination view controller is the detail view controller
        if let detailViewController = segue.destination as? detailRecipeViewController {
            // Get the selected recipe from the sender parameter (assuming you're passing the recipe object as the sender)
            guard let selectedRecipe = sender as? Recipe else { return }
            
            // Pass the selected recipe to the detail view controller
            detailViewController.recipe = selectedRecipe
        }
    }


}

extension SearchBarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as! RecipeCard
                let recipe = recipes[indexPath.item]
                cell.configure(with: recipe)
                return cell
    }

}

extension SearchBarViewController: UICollectionViewDelegate{
    
}

