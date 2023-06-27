//
//  LineEditView.swift
//  SwiftUI List Edit
//
//  Created by Theo Vora on 6/27/23.
//

import SwiftUI

struct LineEditView: View {
    @State private var name: String
    
    init(name: String) {
        _name = State(initialValue: name)
    }
    
    var body: some View {
        TextField("Name", text: $name)
    }
}

struct LineEditView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            LineEditView(name: "Teek")
        }
    }
}
