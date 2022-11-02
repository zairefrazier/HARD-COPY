//
//  LayoutTest.swift
//  Hard Copy
//
//  Created by Zaire on 8/30/22.
//

import SwiftUI
import SceneKit

struct LayoutTest: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @EnvironmentObject private var model: SelectedSize
    
    
    @State var index = 0
    
    @State var count = 1
    var size = ""
    
    
    var product: Product
    
    @Namespace var animation
    
    @State var selectedSize: String = "XS"
    
    var body: some View {
        VStack {
            //HeaderView()
            
            SceneView(scene: SCNScene(named: productList[index].name), options: [.autoenablesDefaultLighting,.allowsCameraControl])
                .frame(height: 300)
            

                .frame(height: 350)
            
            ShirtPropertiesView()
            
        }
        .padding()
        //.padding(.bottom, UIScreen.main.bounds.width - 300)
        
    }
    func ShirtPropertiesView()-> some View{
        
        
        
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                
                Text(productList[index].style)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(LinearGradient(colors: [.blue, .indigo], startPoint: .top, endPoint: .bottom))
                HStack {
                    Button(action: {
                        
                        index = 0
                        
                    }) {
                        
                        Text("1")
                            .frame(width: index == 0 ? 40 : 30, height: index == 0 ? 40 : 30)
                            .foregroundColor(index == 0 ? .blue : .black)
                    }
                    
                    
                    Button(action: {
                        
                        index = 1
                        
                    }) {
                        
                        Text("2")
                            .frame(width: index == 1 ? 40 : 30, height: index == 1 ? 40 : 30)
                            .foregroundColor(index == 1 ? .blue : .black)
                    }
                    
                    Button(action: {
                        
                        index = 2
                        
                    }) {
                        
                        Text("3")
                            .frame(width: index == 2 ? 40 : 30, height: index == 2 ? 40 : 30)
                            .foregroundColor(index == 2 ? .blue : .black)
                    }
                    Button(action: {
                        
                        index = 3
                        
                    }) {
                        
                        Text("4")
                            .frame(width: index == 3 ? 40 : 30, height: index == 3 ? 40 : 30)
                            .foregroundColor(index == 3 ? .blue : .black)
                    }
                }
                .padding(.leading, -5)
                Text("Interactive Graphic Tee")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .padding(.leading,10)
                
                
                
                
            }
            .padding(.top, 0)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 1) {
                Text("Size")
                    .font(.title3.bold())
                Spacer()
                Button {
                    cartManager.addToCart(product: productList[index])
                } label: {
                Text("Add To Cart")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(50)

                }
                
                
            }
            .padding(.leading,10)
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack(spacing: 5) {
                    
                    let sizes = ["XS","S","M","L","XL","XXL","3XL"]
                    
                    ForEach(sizes,id: \.self){i in
                            Text("\(i)")
                                .foregroundColor(selectedSize == i ? .white : .black)
                                .padding(.vertical,8)
                                .padding(.horizontal,15)
                                .background{
                                    ZStack{
                                        
                                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                                            .fill(Color.white.opacity(1))
                                        if selectedSize == i {
                                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                                .fill(Color.blue.opacity(1))
                                                .matchedGeometryEffect(id: "TAB", in: animation)

                                            
                                        }
                                        
                                    
                                        
                                        
                                    }
                                }
                                .onTapGesture{
                                    withAnimation(.easeInOut) {
                                        selectedSize = i
                                        selectedSize = i
                                        productList[index].size = selectedSize
                                        print(i)
                                        
                                        
                                    }
                                }
                        
                    }
                }
                
                
            }
            VStack(alignment: .leading){

                
                Text("100% Cotton T-Shirt with interactive")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                Text("graphic on back.")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
            }
            .padding(.bottom, 15.0)
            
            
        }
    }
    func HeaderView()-> some View {
        HStack{
            
            Text("HARD COPY")
                .font(.system(size: 30))
                .fontWeight(.bold)
            Spacer()
            
            Button{CartView()
                    .environmentObject(cartManager)
                    .environmentObject(model)
            } label: {
                CartButton(numberOfProducts: cartManager.products.count)

            }
            .padding(.bottom)
            
        }
    }
    
}

struct LayoutTest_Previews: PreviewProvider {
    static var previews: some View {
        LayoutTest(product: productList[1])
            .environmentObject(CartManager())
    }
}
