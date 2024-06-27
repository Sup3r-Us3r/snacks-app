//
//  ContentView.swift
//  Snacks
//
//  Created by Mayderson Mello on 23/06/24.
//

import SwiftUI

struct ContentView: View {
  @StateObject var cartManager = CartManager()

  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        HomeView()
          .environmentObject(cartManager)

        if cartManager.products.count > 0 {
          NavigationLink(destination: CartView().environmentObject(cartManager)) {
            HStack(spacing: 30) {
              HStack {
                Text("\(cartManager.products.count)")
                  .padding()
                  .background(.yellow)
                  .clipShape(Circle())
                  .foregroundColor(.black)

                VStack(alignment: .leading) {
                  Text("Cart")
                    .font(.system(size: 26, weight: .semibold))

                  Text("\(cartManager.products.count) Item")
                    .font(.system(size: 18))
                }
              }

              Spacer()

              ZStack {
                HStack(spacing: 30) {
                  ForEach(cartManager.products.prefix(6), id: \.self) { product in
                    Image(product.image)
                      .resizable()
                      .scaledToFit()
                      .frame(width: 60, height: 60)
                      .background(.white)
                      .clipShape(Circle())
                      .overlay(
                        Circle().stroke(.yellow, lineWidth: 4)
                      )
                      .padding(.leading, -60)
                  }
                }

                if cartManager.products.count > 6 {
                  Text("+\(cartManager.products.count - 6)")
                    .font(.system(size: 16, weight: .semibold))
                    .padding(10)
                    .background(.yellow)
                    .foregroundColor(.black)
                    .clipShape(Circle())
                    .offset(x: 70, y: -20)
                }
              }
            }
            .padding(30)
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .foregroundColor(.white)
          }
        }
      }
      .edgesIgnoringSafeArea(.bottom)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
