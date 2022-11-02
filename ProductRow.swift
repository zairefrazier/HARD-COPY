//
//  ProductRow.swift
//  Hard Copy
//
//  Created by Zaire on 6/23/22.
//

import SwiftUI

struct ProductRow: View {
    @EnvironmentObject var cartManager: CartManager
    
    @EnvironmentObject var model : SelectedSize
    
    @State var product: Product
    
    var body: some View {
        HStack(spacing: 20) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 10) {
                Text(product.style)
                    .bold()
                
                Text("$\(product.price)")
                    .font(.caption)
                Text(product.size)
            }
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.839))
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: productList[1])
            .environmentObject(CartManager())
    }
}
