//
//  CollectionView.swift
//  Snacks
//
//  Created by Mayderson Mello on 24/06/24.
//

import SwiftUI

struct CollectionView: View {
  @EnvironmentObject var cartManager: CartManager

  @Environment(\.presentationMode) var mode

  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          // Header
          HStack {
            Text("Order From The Best OF **Snacks**")
              .font(.system(size: 36))
              .padding(.trailing)

            Spacer()

            Button {
              mode.wrappedValue.dismiss()
            } label: {
              Image(systemName: "arrow.left")
                .imageScale(.large)
                .padding()
                .frame(width: 70, height: 90)
                .overlay(
                  RoundedRectangle(cornerRadius: 50)
                    .stroke()
                    .opacity(0.4)
                )
            }
            .foregroundColor(.black)
          }
          .padding(30)

          LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10, content: {
            ForEach(productList, id: \.id) { item in
              SmallProductCard(product: item)
                .environmentObject(cartManager)
            }
          })
          .padding(.horizontal, 10)
        }
      }
    }
    .navigationBarHidden(true)
  }
}

struct CollectionView_Previews: PreviewProvider {
  static var previews: some View {
    CollectionView()
      .environmentObject(CartManager())
  }
}

// Small Product Card View
struct SmallProductCard: View {
  @EnvironmentObject var cartManager: CartManager

  var product: ProductModel

  var body: some View {
    ZStack {
      Image(product.image)
        .resizable()
        .scaledToFit()
        .padding(-90)
        .offset(x: 80, y: 10)
        .rotationEffect(Angle(degrees: 30))

      ZStack {
        VStack(alignment: .leading, content: {
          Text("\(product.name)")
            .font(.system(size: 24, weight: .semibold))
            .frame(width: 140, alignment: .leading)

          Text(product.category)
            .font(.callout)
            .padding()
            .background(.white.opacity(0.5))
            .clipShape(Capsule())

          Spacer()

          HStack {
            Text("$ \(formatPrice(product.price))")
              .font(.system(size: 20, weight: .semibold))

            Spacer()

            Button {
              cartManager.addToCart(product: product)
            } label: {
              Image(systemName: "basket")
                .imageScale(.large)
                .frame(width: 50, height: 50)
                .background(.black)
                .clipShape(Capsule())
                .foregroundColor(.white)
            }
          }
          .padding(.horizontal, 8)
          .padding(.leading)
          .frame(width: .infinity, height: 60)
          .background(.white.opacity(0.8))
          .clipShape(Capsule())
        })
      }
    }
    .padding(20)
    .frame(width: .infinity, height: 280)
    .background(product.color.opacity(0.13))
    .clipShape(RoundedRectangle(cornerRadius: 30))
  }
}
