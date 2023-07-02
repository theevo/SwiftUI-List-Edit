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
    @State private var number = 0 // ensures each "new user" is unique
    
    init(names: [String]) {
        _users = State(initialValue: names)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
            }
            .toolbar(content: {
                Button("Add") {
                    users.insert("New name \(number)", at: 0)
                    number += 1
                }
            })
            .navigationTitle("Hello")
        }
    }
    
    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(names: ["Paul", "Taylor", "Adele"])
    }
}
