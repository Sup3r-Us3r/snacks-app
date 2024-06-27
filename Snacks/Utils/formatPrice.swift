//
//  formatPrice.swift
//  Snacks
//
//  Created by Mayderson Mello on 27/06/24.
//

import SwiftUI

func formatPrice(_ price: Double) -> String {
  let formatter = NumberFormatter()

  formatter.numberStyle = .currency
  formatter.currencyCode = "USD"
  formatter.minimumFractionDigits = 2
  formatter.maximumFractionDigits = 2

  if let formattedPrice = formatter.string(from: NSNumber(value: price)) {
    return formattedPrice.replacingOccurrences(of: "$", with: "")
  } else {
    return "0.00"
  }
}

