//
//  Cell.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/20.
//

import SwiftUI
import Alamofire
// GUI
struct Cell: View {
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text(text).font(.title)
            
            Button(action: {
                self.startLoad()
            }, label: {
                Text("Start").font(.largeTitle)
            })
            
            Button(action: {
                self.text = ""
            }, label: {
                Text("Clear").font(.largeTitle)
            })
            
        }
        .padding()
        
    }
    func startLoad() {
        let parameters = [
            "category":"all", // "tech", "military", "entertainment",
            "request_type":"1", // "2" 1 for 下拉刷新 2 for 上滑屏幕
            "response_extra":""
        ]
        NetworkAPI.getList(parameters:parameters) { result in
            switch result {
            case let .success(list): NSLog(list.gid)
            case let .failure(error): NSLog(error.localizedDescription)
            }
        }
    }
    
    // demo of network
    
    func updateText(_ Text:String) {
        DispatchQueue.main.async {
            self.text = Text
        }
    }
}




struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell()
    }
}
