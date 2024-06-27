//
//  Home.swift
//  Snacks
//
//  Created by Mayderson Mello on 23/06/24.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var cartManager: CartManager

  @State var selectedCategory: String = "Choco"

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

            Image(systemName: "line.3.horizontal")
              .imageScale(.large)
              .padding()
              .frame(width: 70, height: 90)
              .overlay(
                RoundedRectangle(cornerRadius: 50)
                  .stroke()
                  .opacity(0.4)
              )
          }
          .padding(30)

          // Category List
          CategoryListView

          // Collection View
          HStack {
            Text("Choco **Collections**")
              .font(.system(size: 24))

            Spacer()

            NavigationLink {
              CollectionView()
                .environmentObject(cartManager)
            } label: {
              Image(systemName: "arrow.right")
                .imageScale(.large)
            }
            .foregroundColor(.black)
          }
          .padding(.horizontal, 30)
          .padding(.vertical, 15)

          // Product List
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
              ForEach(productList, id: \.id) { item in
                ProductCard(product: item)
                  .environmentObject(cartManager)
              }
            }
            .padding(.horizontal, 30)
          }
        }
      }
    }
  }

  // Category List View
  var CategoryListView: some View {
    HStack {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(categoryList, id: \.id) { item in
            Button {
              selectedCategory = item.title
            } label: {
              HStack {
                if item.title != "All" {
                  Image(systemName: item.icon)
                    .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                }

                Text(item.title)
              }
              .padding(20)
              .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
              .foregroundColor(selectedCategory != item.title ? .black : .white)
              .clipShape(Capsule())
            }
          }
        }
        .padding(.horizontal, 30)
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
      .environmentObject(CartManager())
  }
}

// Product Card View
struct ProductCard: View {
  @EnvironmentObject var cartManager: CartManager

  var product: ProductModel

  var body: some View {
    ZStack {
      Image(product.image)
        .resizable()
        .scaledToFit()
        .padding(-130)
        .offset(x: 90, y: 0)
        .rotationEffect(Angle(degrees: 30))

      ZStack {
        VStack(alignment: .leading, content: {
          Text("\(product.name)")
            .font(.system(size: 30, weight: .semibold))
            .frame(width: 140, alignment: .leading)

          Text(product.category)
            .font(.callout)
            .padding()
            .background(.white.opacity(0.5))
            .clipShape(Capsule())

          Spacer()

          HStack {
            Text("$ \(formatPrice(product.price))")
              .font(.system(size: 24, weight: .semibold))

            Spacer()

            Button {
              cartManager.addToCart(product: product)
            } label: {
              Image(systemName: "basket")
                .imageScale(.large)
                .frame(width: 90, height: 68)
                .background(.black)
                .clipShape(Capsule())
                .foregroundColor(.white)
            }
            .padding(.trailing, -10)
          }
          .padding(.leading)
          .padding()
          .frame(maxWidth: .infinity)
          .frame(height: 80)
          .background(.white.opacity(0.8))
          .clipShape(Capsule())
        })
      }
    }
    .padding(30)
    .frame(width: 336, height: 422)
    .background(product.color.opacity(0.13))
    .clipShape(RoundedRectangle(cornerRadius: 57))
  }
}
