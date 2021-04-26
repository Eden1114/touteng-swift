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
        HStack {
            Text(author.user_name)
            Image(author.avatar)
//            URLImage(url: URL(string: author.avatar) ?? "default value",
//                     content: { image in
//                         image
//                             .resizable()
//                             .aspectRatio(contentMode: .fit)
//                     })
        }
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        let author = Author(avatar: "http://p1-dy.bytexservice.com/origin/pgc-image/acce69d4feb44235852525655ca958e0", user_name: "魏医生在线")
        AuthorView(author: author)
    }
}
