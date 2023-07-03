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
                    newNameTextField
                }
                ForEach(users, id: \.self) { user in
                    Text(user)
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .toolbar(content: {
                if showTextField {
                    cancelButton
                } else {
                    addButton
                    EditButton()
                }
            })
            .navigationTitle("Hello")
        }
    }
    
    var addButton: some View {
        Button {
            withAnimation(.spring()) {
                showTextField = true
                focusedField = .newName
            }
        } label: {
            Image(systemName: "plus")
        }
    }
    
    var cancelButton: some View {
        Button("Cancel") {
            withAnimation(.spring()) {
                reset()
            }
        }
    }
    
    var newNameTextField: some View {
        TextField("Name", text: $newName)
            .focused($focusedField, equals: .newName)
            .onSubmit {
                if newName.isNotEmpty {
                    users.insert(newName, at: 0)
                }
                reset()
            }
            .submitLabel(.done)
    }
    
    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
    
    func move(from offsets: IndexSet, to destination: Int) {
        users.move(fromOffsets: offsets, toOffset: destination)
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
