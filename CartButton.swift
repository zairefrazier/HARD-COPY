//
//  CartButton.swift
//  Hard Copy
//
//  Created by Zaire on 6/23/22.
//

import SwiftUI

struct CartButton: View {
    var numberOfProducts: Int
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart")
                .padding(.top, 5)
                .frame(width: 40, height: 40)
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)").bold()
                    .font(.caption)
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20)
                    .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.839))
                    .cornerRadius(50)
                
            }
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numberOfProducts: 1)
    }
}
