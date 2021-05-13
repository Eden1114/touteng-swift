//
//  EntranceView.swift
//  touteng-swift
//
//  Created by cqs on 2021/5/12.
//

import SwiftUI

struct EntranceView: View {
    @State var showflag1 = true
    @State var showflag2 = true
    var body: some View {
        ZStack{
            if showflag1{
                SplashScreen(showflag1: self.$showflag1)
            }
            else if showflag2{
                LoginView(showflag2: self.$showflag2)
            }
            else{
                ContentView().environmentObject(UserData.testData)
            }
        }
    }
}

struct EntranceView_Previews: PreviewProvider {
    static var previews: some View {
        EntranceView()
    }
}
