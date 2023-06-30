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
            //            .navigationTitle("Hello") // can't attach `.onTap`. this is not a View
            .navigationBarTitleDisplayMode(.automatic)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Hello").font(.largeTitle) // this is ugly
                }
            }
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
