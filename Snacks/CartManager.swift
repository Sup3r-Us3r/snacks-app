//
//  CartManager.swift
//  Snacks
//
//  Created by Mayderson Mello on 25/06/24.
//

import SwiftUI

class CartManager: ObservableObject {
  @Published private(set) var products: [ProductModel] = []
  @Published private(set) var total: Double = 0.0

  func addToCart(product: ProductModel) {
    products.append(product)
    total += product.price
  }

  func removeFromCart(product: ProductModel) {
    products = products.filter { $0.id != product.id }
    total -= product.price
  }
}
