//
//  CollectionView.swift
//  Snacks
//
//  Created by Mayderson Mello on 24/06/24.
//

import SwiftUI

struct CartView: View {
  @EnvironmentObject var cartManager: CartManager

  @Environment(\.presentationMode) var mode

  @State private var showAlert: Bool = false

  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          // Header
          HStack {
            Text("Cart")
              .font(.system(size: 36))
              .padding(.trailing)

            Spacer()

            Button {
              mode.wrappedValue.dismiss()
            } label: {
              Text("\(cartManager.products.count)")
                .imageScale(.large)
                .padding()
                .frame(width: 70, height: 90)
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())

            }
            .foregroundColor(.black)

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

          // Cart Products
          VStack {
            ForEach(cartManager.products, id: \.name) { item in
              CartProductCard(product: item)
            }
          }
          .padding(.horizontal)

          // Total Amount
          VStack(alignment: .leading) {
            HStack {
              Text("Delivery Amount")

              Spacer()

              Text("Free")
                .font(.system(size: 24, weight: .semibold))
            }

            Divider()

            Text("Total Amount")
              .font(.system(size: 24))

            Text("USD \(formatPrice(cartManager.total))")
              .font(.system(size: 36, weight: .semibold))
          }
          .padding(30)
          .frame(maxWidth: .infinity)
          .background(.yellow.opacity(0.5))
          .clipShape(RoundedRectangle(cornerRadius: 50))
          .padding()

          // Button to Make Payment
          Button {
            showAlert = true
          } label: {
            Text("Make Payment")
              .frame(maxWidth: .infinity)
              .frame(height: 80)
              .background(.yellow.opacity(0.5))
              .font(.system(size: 20, weight: .semibold))
              .foregroundColor(.black)
              .clipShape(Capsule())
              .padding()
          }
          .alert(isPresented: $showAlert) {
            Alert(
              title: Text("Make Payment"),
              message: Text("Do you want to complete the purchase?"),
              primaryButton: .default(Text("Confirm")) {
                print("Confirmar pressionado")
              },
              secondaryButton: .cancel(Text("Cancel")) {
                print("Sair pressionado")
              }
            )
          }
        }
      }
    }
    .navigationBarHidden(true)
  }
}

struct CartView_Previews: PreviewProvider {
  static var previews: some View {
    CartView()
      .environmentObject(CartManager())
  }
}

// Cart Product View
struct CartProductCard: View {
  var product: ProductModel

  var body: some View {
    HStack(alignment: .center, spacing: 20) {
      Image(product.image)
        .resizable()
        .scaledToFit()
        .frame(width: 80, height: 80)
        .background(.gray.opacity(0.1))
        .clipShape(Circle())

      VStack(alignment: .leading) {
        Text("\(product.name)")
          .font(.headline)

        Text(product.category)
          .font(.callout)
          .opacity(0.5)
      }

      Spacer()

      Text("$ \(formatPrice(product.price))")
        .padding()
        .background(.yellow.opacity(0.5))
        .clipShape(Capsule())
    }
  }
}
