//
//  Cell.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/20.
//

import SwiftUI

// model
struct PostList:Codable {
    var list: [Post]
}

struct Post: Codable, Identifiable {
    let id :Int
    let avatar: String
    let name: String
    
}

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
    
    
    // demo of network
    func startLoad() {
        let url = URL(string : "http://post.api")!
        
        var request = URLRequest(url:url)
        request.timeoutInterval = 15
        request.httpMethod = "POST"
        
        let dic = ["key": "value"]
        let data = try! JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        
        request.httpBody = data
        request.addValue("application/json", forHTTPHeaderField: "Content/Type")
        
        let task = URLSession.shared.dataTask(with:url) {
            data, response, error in
            if let error = error {
                self.updateText(error.localizedDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
                self.updateText("Invalid Response")
                return
            }
            
            guard let data = data else {
                self.updateText("No data")
                return
            }
            
            guard let list = try? JSONDecoder().decode(PostList.self, from:data) else {
                self.updateText("parse error")
                return
            }
            self.updateText(list.list.description)
        }
        task.resume()
    }
    
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
