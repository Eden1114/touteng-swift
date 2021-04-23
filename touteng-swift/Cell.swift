//
//  Cell.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/20.
//

import SwiftUI
import Alamofire
// GUI
struct Cell: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text(text).font(.title)
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
        Cell()
    }
}
