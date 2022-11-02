//
//  ProductView.swift
//  Hard Copy
//
//  Created by Zaire on 6/23/22.
//

import SwiftUI
import SceneKit
import CoreMedia

struct ProductView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @EnvironmentObject private var model: SelectedSize
    
    @State var selectedSize: String = ""
    
    @State var index = 0
    
    @State var count = 1
    var size = ""
    
    
    var product: Product
    
//    class Model : ObservableObject {
//        
//        @Published var selectedSize: String = "S"
//        
//    }
//    
//    @EnvironmentObject var model : ProductView.Model
    
    var body: some View {
        
            
        VStack {
            
            VStack {
                    
                    HStack(spacing: 20){
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text("BRAND")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundStyle(LinearGradient(colors: [.blue, .indigo], startPoint: .top, endPoint: .bottom))
                            
                            Text("HARD COPY")
                                .foregroundColor(Color.black)
                            
                            Text("SEASON")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundStyle(LinearGradient(colors: [.blue, .indigo], startPoint: .top, endPoint: .bottom))
                                .padding(.top,5)
                            
                            Text("HC2201")
                                .foregroundColor(Color.black)
                            
                            Text("STYLE")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundStyle(LinearGradient(colors: [.blue, .indigo], startPoint: .top, endPoint: .bottom))
                                .padding(.top,5)
                            
                            Text(product.style)
                                .foregroundColor(Color.black)
                            
                            Text("OPTION")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundStyle(LinearGradient(colors: [.blue, .indigo], startPoint: .top, endPoint: .bottom))
                                .padding(.top,10)
                            
                            // Color Buttons...
                            
                            HStack(spacing: 5){
                                
                                Button(action: {
                                    
                                    index = 0
                                    
                                }) {
                                    
                                    Text("1")
                                        .frame(width: index == 0 ? 30 : 20, height: index == 0 ? 30 : 20)
                                        .foregroundColor(index == 0 ? .blue : .black)
                                }
                                
                                
                                Button(action: {
                                    
                                    index = 1
                                    
                                }) {
                                    
                                    Text("2")
                                        .frame(width: index == 1 ? 30 : 20, height: index == 1 ? 30 : 20)
                                        .foregroundColor(index == 1 ? .blue : .black)
                                }
                                
                                Button(action: {
                                    
                                    index = 2
                                    
                                }) {
                                    
                                    Text("3")
                                        .frame(width: index == 2 ? 30 : 20, height: index == 2 ? 30 : 20)
                                        .foregroundColor(index == 2 ? .blue : .black)
                                }
                                Button(action: {
                                    
                                    index = 3
                                    
                                }) {
                                    
                                    Text("4")
                                        .frame(width: index == 3 ? 30 : 20, height: index == 3 ? 30 : 20)
                                        .foregroundColor(index == 3 ? .blue : .black)
                                }
                            }
                            .padding(.top,1)
                        }
                        
                        Spacer(minLength: 0)
                        
                        SceneView(scene: SCNScene(named: productList[index].name), options: [.autoenablesDefaultLighting,.allowsCameraControl])
                            .frame(width:235, height: 300)
                            .padding(.trailing)

                    }
                    .padding(.leading,20)
                    .padding(.top,-30)
                    
            }
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom,5)
            HStack(spacing: 10){
                
                Text("T-Shirt")
                    .font(.system(size: 35))
                    .foregroundColor(.black)
                
                Spacer()
                
                
                Text("$ 35")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 12) {
                
                Text("Size")
                    .fontWeight(.bold)
                
                HStack(spacing: 15){
                    
                    ForEach(sizes,id: \.self){i in
                        
                        Button(action: {
                            selectedSize = i
                            productList[index].size = selectedSize
                            print(i)
                            print(productList[index].size)
                        }) {
                            
                            Text("\(i)")
                                .font(UIScreen.main.bounds.height < 750 ? .caption : .body)
                                .foregroundColor(selectedSize == i ? .white : .black)
                                .padding(.vertical,8)
                                .padding(.horizontal,10)
                                .background(
                                
                                    ZStack{
                                        
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.blue.opacity(selectedSize == i ? 1 : 0))
                                        
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.blue,lineWidth: 1)
                                    
                                        
                                        
                                    }
                                )
                        }
                    }
                }
                
                Text("About")
                    .fontWeight(.bold)
                    .padding(.top,10)
                
                Text("100% Cotton T-Shirt with interactive graphic on back.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal)
            
            HStack(spacing: 15){
                
                
                Button {
                    cartManager.addToCart(product: productList[index])
                } label: {
                Text("Add To Cart")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.indigo]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(50)

                }
            }
            .padding(.horizontal)
            .padding(.vertical,30)

        }
        CartView().environmentObject(model)
    }
}
        
        

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProductView(product: productList[0])
                .environmentObject(CartManager())
                .previewInterfaceOrientation(.portrait)
            ProductView(product: productList[0])
                .environmentObject(CartManager())
                .previewInterfaceOrientation(.landscapeLeft)
        }
        
    }
}
//struct BottomView : View {
//
//    @State var selectedSize = "S"
//    @State var count = 1
//    @EnvironmentObject var cartManager: CartManager
//    @State var index = 0
//    var product: Product
//    var body: some View{
//
//        HStack(spacing: 20){
//
//            Text("T-Shirt")
//                .font(.system(size: 35))
//                .foregroundColor(.black)
//
//            Spacer()
//
//
//            Text("$ 799")
//                .font(.system(size: 25))
//                .fontWeight(.bold)
//                .foregroundColor(.black)
//        }
//        .padding()
//
//        VStack(alignment: .leading, spacing: 12) {
//
//            Text("Size")
//                .fontWeight(.bold)
//
//            HStack(spacing: 15){
//
//                ForEach(sizes,id: \.self){i in
//
//                    Button(action: {
//                        selectedSize = i
//                    }) {
//
//                        Text("\(i)")
//                            .font(UIScreen.main.bounds.height < 750 ? .caption : .body)
//                            .foregroundColor(selectedSize == i ? .white : .black)
//                            .padding(.vertical,8)
//                            .padding(.horizontal,10)
//                            .background(
//
//                                ZStack{
//
//                                    RoundedRectangle(cornerRadius: 5)
//                                        .fill(Color("Color1").opacity(selectedSize == i ? 1 : 0))
//
//                                    RoundedRectangle(cornerRadius: 5)
//                                        .stroke(Color("Color1"),lineWidth: 1)
//                                }
//                            )
//                    }
//                }
//            }
//
//            Text("About")
//                .fontWeight(.bold)
//                .padding(.top,10)
//
//            Text("Mustard yellow printed waist length T-shirt, has a round neck, long sleeves with cut-out detail, high-low hem. 100% Original Products")
//                .foregroundColor(.gray)
//                .multilineTextAlignment(.leading)
//        }
//        .padding(.horizontal)
//
//        HStack(spacing: 15){
//
//            // cart buttons...
//
//            Button(action: {
//
//                count += 1
//
//            }) {
//
//                Image(systemName: "plus")
//                    .font(.system(size: 20))
//                    .foregroundColor(Color("Color1"))
//                    .padding()
//                    .background(Color.white)
//                    .clipShape(Circle())
//                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
//            }
//
//            Text("\(count)")
//                .font(.title)
//                .fontWeight(.bold)
//
//            Button(action: {
//
//                if count > 1{
//
//                    count -= 1
//                }
//
//            }) {
//
//                Image(systemName: "minus")
//                    .font(.system(size: 26))
//                    .foregroundColor(Color("Color1"))
//                    .padding()
//                    .background(Color.white)
//                    .clipShape(Circle())
//                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
//            }
//
//            // add to cart...
//
//            Spacer(minLength: 0)
//
//            Button {
//            cartManager.addToCart(product: product)
//            } label: {
//            Text("Add To Cart")
//                .padding(10)
//                .foregroundColor(.white)
//                .background(.gray)
//                .cornerRadius(50)
//
//            }
//        }
//        .padding(.horizontal)
//        .padding(.vertical,30)
//    }
//}

var sizes = ["S","M","L","X","XX","XL","XXL"]
