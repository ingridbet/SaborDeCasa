//
//  RecipeDetailViewController.swift
//  SaborDeCasa
//
//  Created by Ingrid Betancourt on 4/26/24.
//

import UIKit

class RecipeListViewController: UIViewController {

   
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // The main recipes array initialized with a default value of an empty array.
    var recipes = [Recipe]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
    }
    

    // Refresh the tasks list each time the view appears in case any tasks were updated on the other tab.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        refreshRecipes()
    }
    
    private func refreshRecipes() {
        
        var recipes = Recipe.getRecipes()
        
        print("✅ We got \(recipes) recipes!")
        
        self.recipes = recipes
        
        collectionView.reloadData()
    }
}

extension RecipeListViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as! RecipeCard
        let recipe = recipes[indexPath.item]
        print("✅ cellforItem \(recipe) recipes!")
        cell.configure(with: recipe)
        return cell
    }
}

extension RecipeListViewController: UICollectionViewDelegate{
    
}


extension RecipeListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           // Calculate the desired size for your cells here
           let numberOfItemsPerRow: CGFloat = 2 // Change this value based on the desired number of items per row
           let spacingBetweenCells: CGFloat = 10 // Change this value based on the desired spacing between cells
           
           let totalSpacingWidth = spacingBetweenCells * (numberOfItemsPerRow - 1)
           let cellWidth = (collectionView.bounds.width - totalSpacingWidth) / numberOfItemsPerRow
           let cellHeight: CGFloat = 100 // Adjust as needed
           
           return CGSize(width: cellWidth, height: cellHeight)
       }
       
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           // Calculate the inset for the section to center the cells horizontally
           let numberOfItemsPerRow: CGFloat = 2 // Change this value based on the desired number of items per row
           let spacingBetweenCells: CGFloat = 10 // Change this value based on the desired spacing between cells
           
           let totalCellWidth = collectionView.bounds.width - (numberOfItemsPerRow - 1) * spacingBetweenCells
           let totalSpacingWidth = spacingBetweenCells * (numberOfItemsPerRow - 1)
           let leftInset = (collectionView.bounds.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
           let rightInset = leftInset
           
           return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
       }
}

extension RecipeListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowRecipeDetailSegue", // Replace "YourSegueIdentifier" with the actual identifier of your segue
           let indexPath = collectionView.indexPathsForSelectedItems?.first, // Get the indexPath of the selected item
           let destinationVC = segue.destination as? detailRecipeViewController {
            
            // Retrieve the selected recipe from your data source
            let selectedRecipe = recipes[indexPath.item] // Assuming "recipes" is your array of Recipe objects
            
            // Pass the selected recipe to the detail view controller
            destinationVC.recipe = selectedRecipe
        }
    }
}
