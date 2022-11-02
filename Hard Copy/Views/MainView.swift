//
//  MainView.swift
//  Hard Copy
//
//  Created by Zaire on 6/23/22.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var cartManager = CartManager()
    
    @StateObject var model = SelectedSize()
    
    var body: some View {
        
        NavigationView {
            
            ForEach(productList, id: \.id) { product in LayoutTest(product: product)
                    .environmentObject(cartManager)
                    .environmentObject(model)
            }
            .navigationTitle(Text("HARD COPY"))
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                        .environmentObject(model)
                }
            label: {
                    CartButton(numberOfProducts: cartManager.products.count)

                }
                

                
            }
            .padding()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .preferredColorScheme(.light)
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
