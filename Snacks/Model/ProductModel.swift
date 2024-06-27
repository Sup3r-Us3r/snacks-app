//
//  ProductModel.swift
//  Snacks
//
//  Created by Mayderson Mello on 23/06/24.
//

import SwiftUI

struct ProductModel: Identifiable, Hashable {
  var id: UUID = .init()
  var name: String
  var category: String
  var image: String
  var color: Color
  var price: Double
}

var productList = [
  ProductModel(name: "Good Source", category: "Choco", image: "image1", color: .pink, price: 10.20),
  ProductModel(name: "Unreal Muffins", category: "Choco", image: "image2", color: .yellow, price: 18.30),
  ProductModel(name: "Twister Chips", category: "Chips", image: "image3", color: .red, price: 25.0),
  ProductModel(name: "Twister Chips", category: "Chips", image: "image4", color: .green, price: 13.15),
  ProductModel(name: "Regular Nature", category: "Chips", image: "image5", color: .blue, price: 5.0),
  ProductModel(name: "Dark Russet", category: "Chips", image: "image6", color: .brown, price: 23.23),
  ProductModel(name: "Smiths Chips", category: "Chips", image: "image3", color: .orange, price: 19.0),
  ProductModel(name: "Deep River", category: "Chips", image: "image7", color: .purple, price: 12.99),
]
