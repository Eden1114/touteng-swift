//
//  ContentView.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/19.
//

//import SwiftUI
//import CoreData
//
//struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        List {
//            ForEach(items) { item in
//                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//            }
//            .onDelete(perform: deleteItems)
//        }
//        .toolbar {
//            #if os(iOS)
//            EditButton()
//            #endif
//
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//            }
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}


import SwiftUI
import Foundation
import SwiftyJSON

struct toutengView: View {
    var body: some View {
        return VStack {
            ForEach(0..<4) { index in
                ZStack{
                    RoundedRectangle(cornerRadius: 10).fill(Color.white)
                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                    Text("ghost")
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
    }
}


struct ContentView: View {
    @State private var text = ""
    var body: some View {
        return NavigationView {
            Form {
                Section {
                    Text("Hello World")
                }
                Section {
                    Text("Hello World")
                }
            }
            .navigationBarTitle(Text("头疼"))
            
            TabView {
                VStack {
                    Text("The home page.")
                    Button(action: {
                        self.startLoad()
                    }) {
                        Text("Start").font(.largeTitle)
                    }
                }
                .tabItem({
                    Image(systemName: "gear")
                    Text("全部")
                    RoundedRectangle(cornerRadius: 10.0)
                })
                .tag(0)

                VStack {
                    Text("The settings page.")
                }
                .tabItem({
                    Image(systemName: "gear")
                    Text("军事")
                    RoundedRectangle(cornerRadius: 10.0)
                })
                .tag(1)
               
                
                VStack {
                    Text("The settings page.")
                }
                .tabItem({
                    Image(systemName: "gear")
                    Text("娱乐")
                    RoundedRectangle(cornerRadius: 10.0)
                })
                .tag(1)
              }
            }
        }
                    
    func startLoad() -> Void {
        NetworkAPI.getList(parameters:
                            ["category":"all",
                             "request_type": "1",
                             "response_extra":""]) {result in
            switch result {
            case let .success(data):
                let json = try! JSON(data: data)
                self.update(json["code"])
            case let .failure(error): self.update(error.localizedDescription)
            }
        }
    }
    func update(_ text: Any) {
//        NSLog(text)
        debugPrint(text)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
