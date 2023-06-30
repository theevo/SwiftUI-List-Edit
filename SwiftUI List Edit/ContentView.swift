//
//  ContentView.swift
//  SwiftUI List Edit
//
//  Created by Theo Vora on 6/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [String] = []
    @State private var newName = ""
    @State private var renameIndex: Int?
    
    init(names: [String]) {
        _users = State(initialValue: names)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(users.enumerated()), id: \.element) { index, user in
                    if let renameIndex, renameIndex == index {
                        TextField("rename me", text: $newName)
                    } else {
                        Text(user)
                            .swipeActions(allowsFullSwipe: false) {
                                Button(role: .destructive) {
                                    delete(at: index)
                                    
                                } label: {
                                    Label("Delete", systemImage: "trash.fill")
                                }
                                Button("Rename") {
                                    print("rename \(user)")
                                    renameIndex = index
                                    newName = users[index]
                                }
                            }
                    }
                }
            }
            .navigationTitle("Hello")
            
        }
    }
    
    func delete(at index: Int) {
        let user = users.remove(at: index)
        print("deleted \(user)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(names: ["Paul", "Taylor", "Adele"])
    }
}
