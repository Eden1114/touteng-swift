//
//  AuthorView.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/26.
//

import SwiftUI
import SDWebImageSwiftUI


struct AuthorView: View {
    var author :Author
    
    var body: some View {
        HStack() {
            if author.avatar != "" {
                WebImage(url: author.avatar_url)
                    .resizable()
                    .frame(width: 12, height: 12)
            }
            Text(author.user_name)
                .font(.custom("STZhongsong",size: 12))
                .lineLimit(1)
                .foregroundColor(Color(red: 160/255, green: 160/255, blue: 160/255))
        }.fixedSize()
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        
        let author = Author(avatar: "https://p1-dy.bytexservice.com/origin/pgc-image/acce69d4feb44235852525655ca958e0", user_name: "魏医生在线")
        
        AuthorView(author: author)
    }
}
