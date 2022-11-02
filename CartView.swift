//
//  CartView.swift
//  Hard Copy
//
//  Created by Zaire on 6/23/22.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @EnvironmentObject private var model: SelectedSize
    
    var body: some View {
        ScrollView {
            if cartManager.paymentSuccess {
                Text("Thanks for your prchase! Your shirt will be arriving soon! You should receive an email confirmation shortly.")
                    .padding()
            } else {
                if cartManager.products.count >
                    0 {
                    ForEach(cartManager.products, id: \.id) {product in ProductRow(product: product).environmentObject(model)}
                    
                    HStack {
                        Text("Your Cart Total: ")
                        Spacer()
                        Text("$\(cartManager.total).00")
                            .bold()
                    }
                    .padding()
                    
                    PaymentButton(action: cartManager.pay)
                        .padding()
                    
                }
                else {
                    Text("Your Cart Is Empty")
                    
                }
                
            }
 
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
        .onDisappear{
            if cartManager.paymentSuccess {
                cartManager.paymentSuccess = false
            }
        }
    }
}

struct CarView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
            .environmentObject(SelectedSize())
    }
}
