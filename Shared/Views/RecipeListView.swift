//
//  RecipeListView.swift
//  Building MultiPlatform App in SwiftUI - MyRecipe App
//
//  Created by Seungchul Ha on 2022/12/03.
//

import SwiftUI

// Filter
enum FilterCourse: String, CaseIterable, Identifiable {
    
    case all = "All"
    case starters = "Starters"
    case entrees = "Entrees"
    case desserts = "Desserts"
    
    var id: FilterCourse { self }
}

struct RecipeListView: View {
    
    let recipes: [Recipe]
    
    // MARK: Filter
    @State private var filter = FilterCourse.all
    var filteredRecipes: [Recipe] {
        recipes.filter { recipe in
            (filter == .all) || (recipe.course.rawValue == filter.rawValue)
        }
    }
    
    var body: some View {
        List(filteredRecipes) { recipe in
            
            NavigationLink {
                RecipeDetailView(recipe: recipe)
            } label: {
                HStack {
                    Image(recipe.photo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        )
                    Text(recipe.name)
                        .font(.headline.bold())
                }
                .padding(6)
            }
            
        }
        .toolbar {
            
            // MARK: Filter
            ToolbarItem {
                Menu {
                    Picker("Course", selection: $filter) {
                        ForEach(FilterCourse.allCases) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                } label: {
                    Label("Filter", systemImage: "slider.horizontal.3")
                }
            }
            
        }
        .navigationTitle("Recipes")
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecipeListView(recipes: Recipe.all())
        }
    }
}
