//
//  RecipeComposeViewController.swift
//  SaborDeCasa
//
//  Created by Ingrid Betancourt on 4/21/24.
//

import UIKit

class RecipeComposeViewController: UIViewController {

    @IBOutlet weak var recipeNameTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var ingredientsTextView: UITextView!
    @IBOutlet weak var directionsTextView: UITextView!
    
    var recipeToEdit: Recipe?
    
    var onComposeRecipe: ((Recipe) -> Void)? = nil
    
    let categories = ["Breakfast", "Appetizer", "Main", "Side", "Dessert", "Snack", "Drink"]
    
    var categoryPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //if categoryTextField.text?.isEmpty ?? true {
          //      categoryTextField.text = categories.first
         //   }
        //categoryTextField.isUserInteractionEnabled = false
        categoryTextField.inputView = categoryPickerView
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        

        // 1.
        if let recipe = recipeToEdit {
            recipeNameTextField.text = recipe.recipeName
            //categoryTextField.text = recipe.categoryText
            descriptionTextView.text = recipe.descriptions
            ingredientsTextView.text = recipe.ingredients
            directionsTextView.text = recipe.directions

            // 2.
            self.title = "Edit Recipe"
        }
    }
        
    @IBAction func didTapDoneButton(_ sender: Any) {
        // 1.
        guard let recipeName = recipeNameTextField.text,
              !recipeName.isEmpty
        else {
            // i.
            presentAlert(title: "Oops...", message: "Make sure to add a name!")
            // ii.
            return
        }
        // 2.
        var recipe: Recipe
        // 3.
        if let editRecipe = recipeToEdit {
            // i.
            recipe = editRecipe
            // ii.
            recipe.recipeName = recipeName
            //recipe.categoryText = categoryTextField.text
            recipe.descriptions = descriptionTextView.text
            recipe.ingredients = ingredientsTextView.text
            recipe.directions = directionsTextView.text
        } else {
            // 4.
            recipe = Recipe(id: UUID().uuidString,
                        recipeName: recipeName,
                        descriptions: descriptionTextView.text,
                        ingredients: ingredientsTextView.text,
                        directions: directionsTextView.text)
        }
        // 5.
        onComposeRecipe?(recipe)
        // 6.
        dismiss(animated: true)
        
        
    }
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    
    private func presentAlert(title: String, message: String) {
        // 1.
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        // 2.
        let okAction = UIAlertAction(title: "OK", style: .default)
        // 3.
        alertController.addAction(okAction)
        // 4.
        present(alertController, animated: true)
    }
    
}

extension RecipeComposeViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = categories[row]
        categoryTextField.resignFirstResponder()
    }
}
