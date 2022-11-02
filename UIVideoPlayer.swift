//
//  UIVideoPlayer.swift
//  Hard Copy
//
//  Created by Zaire on 6/24/22.
//

import SwiftUI
import AVKit

struct UIVideoPlayer: View {
    
    @State private var isActive = false
    
    @State private var size = 0.4
    
    @State private var opacity = 0.5
    
    @State var shortString = true
    
    let videoUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "video 2", ofType: "MOV")!)
    
    let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video 2", ofType: "MOV")!))
    
    var body: some View {
        if isActive {
            ContentView()
            
        } else {
            VStack {
                VStack {
                    Text(shortString ? "This is short." : "Does it matter if you can't get the **HARD COPY**")
                    + Text("TM")
                                  .font(.system(size: 8.0))
                                  .baselineOffset(6.0)
                        
                }
                                .onAppear {
                                    withAnimation(.easeIn(duration: 5.0)) {
                                        self.shortString.toggle()
                                    }
                                }

            }

            .preferredColorScheme(.light)
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) {
                    self.shortString.toggle()
                    self.isActive = true
                }
            }
            
        }

    }
}

struct UIVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        UIVideoPlayer()
    }
}
