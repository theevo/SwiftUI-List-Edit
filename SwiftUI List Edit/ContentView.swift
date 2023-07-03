//
//  ContentView.swift
//  SwiftUI List Edit
//
//  Created by Theo Vora on 6/26/23.
//

import SwiftUI

struct ContentView: View {
    enum FocusedField {
        case newName
    }
    
    @State private var users: [String] = []
    @State private var newName = ""
    @State private var showTextField = false
    @FocusState private var focusedField: FocusedField?
    
    init(names: [String]) {
        _users = State(initialValue: names)
    }
    
    var body: some View {
        NavigationView {
            List {
                if showTextField {
                    TextField("Name", text: $newName)
                        .focused($focusedField, equals: .newName)
                        .onSubmit {
                            if newName.isNotEmpty {
                                users.insert(newName, at: 0)
                            }
                            reset()
                        }
                }
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
                .onDelete(perform: delete)
            }
            .toolbar(content: {
                if showTextField {
                    Button("Cancel") {
                        withAnimation(.spring()) {
                            reset()
                        }
                    }
                } else {
                    Button("Add") {
                        withAnimation(.spring()) {
                            showTextField = true
                            focusedField = .newName
                        }
                    }
                }
            })
            .navigationTitle("Hello")
        }
    }
    
    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
    
    private func reset() {
        showTextField = false
        newName = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(names: ["Paul", "Taylor", "Adele"])
    }
}

extension Collection {
    var isNotEmpty: Bool {
        !self.isEmpty
    }
}
