//
//  testView.swift
//  touteng-swift
//
//  Created by Eden on 2021/5/6.
//

import SwiftUI



struct testView: View {
 
    @EnvironmentObject var userData:UserData
    
    var body:some View {
        Text("123")
    }
}


struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
