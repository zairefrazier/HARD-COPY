//
//  Products.swift
//  Hard Copy
//
//  Created by Zaire on 6/23/22.
//

import Foundation
import SwiftUI



struct Product: Identifiable {
    
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    var style: String
    var size: String
    
}
var productList = [Product(name: "e327a270-62a7-49a6-ae1c-035440b582d9-6.usdz", image: "Shirt1", price: 35, style: "\"HARD BIRDS\"",size: "S"),
                   Product(name: "e327a270-62a7-49a6-ae1c-035440b582d9-4.usdz", image: "savingPNG 3", price: 35, style: "\"HARD BIRDS\"",size: "M"),
                   Product(name: "e327a270-62a7-49a6-ae1c-035440b582d9-8.usdz", image: "Shirt2", price: 35, style: "\"HARD PHONE\"",size: "X"),
                   Product(name: "e327a270-62a7-49a6-ae1c-035440b582d9-7.usdz", image: "Shirt3", price: 35, style: "\"HARD PHONE\"",size: "XL")]

