//
//  Recipe.swift
//  SaborDeCasa
//
//  Created by Ingrid Betancourt on 4/21/24.
//

import Foundation

struct Recipe : Codable {
    let id: String
    var recipeName: String?
    var categoryText: String?
    var descriptions: String?
    var ingredients: String?
    var directions: String?
    
    init(id: String, recipeName: String,categoryText: String?, descriptions: String? = nil,ingredients: String? = nil, directions: String?) {
        self.id = id
        self.recipeName = recipeName
        self.categoryText = categoryText
        self.descriptions = descriptions
        self.ingredients = ingredients
        self.directions = directions
    }
}

extension Recipe {
    // Given an array of tasks, encodes them to data and saves to UserDefaults.
    static func save(_ recipes: [Recipe]) {

        // TODO: Save the array of tasks
        let defaults = UserDefaults.standard
        let encodedData = try! JSONEncoder().encode(recipes)
        defaults.set(encodedData, forKey: "recipes")
        print("Recipes saved successfully.")
    }

    // Retrieve an array of saved tasks from UserDefaults.
    static func getRecipes() -> [Recipe] {
        
        // TODO: Get the array of saved tasks from UserDefaults
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: "recipes") {
            let decodedTasks = try! JSONDecoder().decode([Recipe].self, from: data)
                // 4.
            print("Recipes retrieved successfully.")
            return decodedTasks
        } else {
                // 5.
            return []
        }
    }

    // Add a new task or update an existing task with the current task.
    func save() {

        // TODO: Save the current task
        //Get the array of saved tasks using the getTasks() -> [Task] method.
        var savedRecipes = Recipe.getRecipes()
        if let index = savedRecipes.firstIndex(where: {$0.id == self.id}){
            //Remove the existing task from the array.
            savedRecipes.remove(at: index)
            //Insert the updated task in place of the task you removed.
            savedRecipes.insert(self, at: index)
        } else{
            savedRecipes.append(self)
        }
        Recipe.save(savedRecipes)
    }
}
