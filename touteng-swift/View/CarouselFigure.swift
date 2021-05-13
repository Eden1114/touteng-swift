//
//  CarouselFigure.swift
//  touteng-swift
//
//  Created by cqs on 2021/5/12.
//

import SwiftUI

//let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()  // 自动轮播，计时器

struct CarouselFigure: View {
    var body: some View {
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        //Images...
    
        ForEach(1...6,id:\.self){index in

            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                
                //Geometry Reader For Parallax Effect...
                GeometryReader{reader in
                    
                    Image("p\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        // moving view to the opposite side
                        // when user starts to swipe...
                        // this will create parallax effect...
                        .offset(x: -reader.frame(in: .global).minX)
                        .frame(width: width, height: height/2)
                        //.cornerRadius(15)
                }
                
                .frame(height: height/2)
                .cornerRadius(15)
                .padding(10)
                .background(Color.white)
                .cornerRadius(15)
                // shadow...
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: -5)
                // decreasing width by padding...
                // so outer view only decreased...
                // inner image will be full width...
                
                
                // Bottom image...
                Image("headerImg")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 55, height: 55)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(color: Color/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.1), radius: 5, x: 5, y: 5)
                    .padding(5)
                    .background(Color.white)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .offset(x: -15, y: 25)
            })
            .padding(.horizontal,25)
            
        }
        
        
        
    }
    
}

struct CarouselFigure_Previews: PreviewProvider {
    static var previews: some View {
        CarouselFigure()
    }
}

