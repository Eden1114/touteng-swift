//
//  URLImage.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/26.
//

import SwiftUI

struct URLImageView: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placeholder: String = "placeholder") {
        if (url.hasPrefix("http://")) {
            self.url = url.replacingOccurrences(of: "http://", with: "https://")
        } else {
            self.url = url
        }
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()
        } else {
            return Image("placeholder").resizable()
        }
        
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImageView(url: "http://p1-tt-ipv6.byteimg.com/img/pgc-image/SUewhNHGTrydHV~tplv-tt-shrink:1080:0.image?from=feed")
    }
}
