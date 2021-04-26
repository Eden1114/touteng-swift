//
//  Cell.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/20.
//

import SwiftUI


struct PostCell: View {
    @State var article:Article?
    @State private var text = "on Tap Gesture"
    
    var body: some View {
        VStack {
            Text(text).font(.title).onTapGesture {
                self.text = "123"
            }
            
            Button(action: {

            }, label: {
                Text("Start").font(.largeTitle)
            })
            
            Button(action: {
                self.text = ""
            }, label: {
                Text("Clear").font(.largeTitle)
            })
        }
        .padding()
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell()
    }
}
