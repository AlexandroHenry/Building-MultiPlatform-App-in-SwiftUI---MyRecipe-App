//
//  ContentView.swift
//  MyRecipeApp-iOS
//
//  Created by Seungchul Ha on 2022/12/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            RecipeListView(recipes: Recipe.all())
                .listStyle(PlainListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
