//
//  testView.swift
//  touteng-swift
//
//  Created by Eden on 2021/5/6.
//

import SwiftUI

//struct testView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

struct testView: View {
 
    @State var str = "原图"
    
//    var body: some View {
//        let tad = DragGesture()
//            .onChanged { value in
//                if(value.translation.width > 0) {
//                    print("右滑动")
//                }else {
//                    print("左滑动")
//                }
//        }.onEnded { _ in
//            self.str = "新图"
//        }
//
//        return TabView {
//            Text("\(str)")
//        }.gesture(tad)
//    }
    
    var body:some View {
//        Image("placeholder")
//        Image("icybay")
        Image("AppIcon").resizable()
    }
}


struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
