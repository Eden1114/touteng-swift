//
//  SplashScreen.swift
//  touteng-swift
//
//  Created by cqs on 2021/5/12.
//

import SwiftUI

struct SplashScreen: View {
    @Binding var showflag1: Bool
    @State var selected : Int = 0
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    //var X = UIScreen.main.bounds.width
    //var Y = UIScreen.main.bounds.height
    
    var body: some View {
        
        TabView(selection: $selected,
                content:
                {
            
                    // 明日头疼标签
                    VStack{
                
                        Text("明日头疼app")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.orange)
                            .padding(20)
                            //.offset(x: 0, y: -(height * 0.8))
                    // app标语
                        Text("离你更近")
                            .font(Font.system(size: 16))
                        //.fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(2)
                        Text("更快更新")
                            .font(Font.system(size: 16))
                        //.fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(2)
                        Text("最新资讯尽在“明日头疼”")
                            .font(Font.system(size: 16))
                        //.fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(5)
                        
                        TabView(selection: $selected,
                                content:  {
                                    CarouselFigure()
                                }
                       
                        )
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
                
                
                    // 按钮
                    Button("开始使用"){
                        self.showflag1.toggle()
                    }
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.orange)
                    .overlay(
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(Color.orange, lineWidth: 2)
                    )
                    //Spacer()
                .padding(10)
                //Spacer()
            
            //.offset(x: 0, y: -150)
            }
           }
        )
    
}
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen(showflag1: .constant(true))
    }
}

