//
//  ContentView.swift
//  SwiftUI List Edit
//
//  Created by Theo Vora on 6/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var editMode: EditMode = .inactive
    @State private var users = ["Paul", "Taylor", "Adele"]
    @State private var newName = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(Array(users.enumerated()), id: \.element) { index, user in
                    if editMode.isEditing == true {
                        TextField("\(index). \(user)", text: $newName)
                    } else {
                        Text(user)
                    }
                }
                .onDelete(perform: delete)
            }
            .animation(.easeInOut, value: editMode)
            .toolbar {
                EditButton()
            }
            .navigationTitle("Hello")
            .environment(\.editMode, $editMode)
        }
    }

    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
