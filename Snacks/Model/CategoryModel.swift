//
//  CategoryModel.swift
//  Snacks
//
//  Created by Mayderson Mello on 23/06/24.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable {
  var id: UUID = .init()
  var icon: String
  var title: String
}

var categoryList: [CategoryModel] = [
  CategoryModel(icon: "", title: "All"),
  CategoryModel(icon: "birthday.cake", title: "Choco"),
  CategoryModel(icon: "birthday.cake", title: "Waffles"),
  CategoryModel(icon: "birthday.cake", title: "Toffe")
]
