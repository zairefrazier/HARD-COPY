//
//  ContentView.swift
//  Hard Copy
//
//  Created by Zaire on 6/23/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        TabView{
            MainView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                    
                }
            
            ARViewContainer().edgesIgnoringSafeArea(.top)
                .tabItem {
                    Image(systemName: "square.stack.3d.up")
                    Text("Scan")
                    
                }
//            LayoutTest()
//                .tabItem {
//                    Image(systemName: "car")
//                    Text("Home")
//                }
            
        }
        .preferredColorScheme(.light)
        
    }

}
struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        let box1Anchor = try! Experience.loadBox1()
        let box2Anchor = try! Experience.loadBox2()
        let box3Anchor = try! Experience.loadBox3()
        
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        arView.scene.anchors.append(box1Anchor)
        arView.scene.anchors.append(box2Anchor)
        arView.scene.anchors.append(box3Anchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
