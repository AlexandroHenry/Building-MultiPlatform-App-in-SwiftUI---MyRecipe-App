//
//  RecipeDetailView.swift
//  Building MultiPlatform App in SwiftUI - MyRecipe App
//
//  Created by Seungchul Ha on 2022/12/03.
//

import SwiftUI

struct RecipeDetailView: View {
    
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image(recipe.photo)
                    .resizable()
                    .clipShape(
                        RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                    )
                    .aspectRatio(1.0, contentMode: .fit)
                    .padding(.bottom, 20)
                Spacer()
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(recipe.course.title)
                        .font(.caption)
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 10.0, style: .continuous)
                        )
                        .padding([.bottom], 10)
                }
                
                Text(recipe.description)
                HStack {
                    Text("Rating")
                        .font(.headline)
                    RatingView(rating: .constant(recipe.rating))
                }
                .padding(.top, 20)
            }
            .padding()
            .navigationTitle(recipe.name)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe.all()[0])
    }
}
