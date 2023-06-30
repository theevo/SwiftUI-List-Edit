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
                                Button("Rename") {
                                    print("rename \(user)")
                                    renameIndex = index
                                }
                            }
                    }
                }
            }
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
