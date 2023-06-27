//
//  SingleLineEditView.swift
//  SwiftUI List Edit
//
//  Created by Theo Vora on 6/27/23.
//

import SwiftUI

struct SingleLineEditView: View {
    @Environment(\.editMode) private var editMode
    @State private var name = "Maria Ruiz"
    
    var body: some View {
        Form {
            if editMode?.wrappedValue.isEditing == true {
                TextField("Name", text: $name)
            } else {
                Text(name)
            }
        }
        .animation(nil, value: editMode?.wrappedValue)
        .toolbar { // Assumes embedding this view in a NavigationView.
            EditButton()
        }
    }
}

struct SingleLineEditView_Previews: PreviewProvider {
    static var previews: some View {
        SingleLineEditView()
    }
}
