//
//  AuthorView.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/26.
//

import SwiftUI
//import URLImage


struct AuthorView: View {
    @State var author :Author
    var body: some View {
        HStack() {
            URLImageView(url: author.avatar)
                .frame(width: 20, height: 20)
            Text(author.user_name)
                .font(.custom("STZhongsong",size: 10))
//                .foregroundColor(.orange)
                .lineLimit(1)
            
//                .overlay(
//                    RoundedRectangle(cornerRadius: 12).stroke(Color.red
//                    ,lineWidth: 2)
//
//                )
        }.fixedSize()
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        
        let author = Author(avatar: "https://p1-dy.bytexservice.com/origin/pgc-image/acce69d4feb44235852525655ca958e0", user_name: "魏医生在线")
        
        AuthorView(author: author)
    }
}
