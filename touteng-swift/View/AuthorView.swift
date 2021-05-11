//
//  AuthorView.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/26.
//

import SwiftUI
import SDWebImageSwiftUI


struct AuthorView: View {
    @State var author :Author
    var body: some View {
        HStack() {
            WebImage(url: author.avatar_url)
                .resizable()
                .frame(width: 20, height: 20)
                
            Text(author.user_name)
                .font(.custom("STZhongsong",size: 15))
                .lineLimit(1)
        }.fixedSize()
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        
        let author = Author(avatar: "https://p1-dy.bytexservice.com/origin/pgc-image/acce69d4feb44235852525655ca958e0", user_name: "魏医生在线")
        
        AuthorView(author: author)
    }
}
