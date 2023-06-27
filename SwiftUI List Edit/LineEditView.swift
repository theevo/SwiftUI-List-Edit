//
//  LineEditView.swift
//  SwiftUI List Edit
//
//  Created by Theo Vora on 6/27/23.
//

import SwiftUI

struct LineEditView: View {
    @State var name: String
    
    var body: some View {
        TextField("foo", text: $name)
    }
}

struct LineEditView_Previews: PreviewProvider {
    static var previews: some View {
        LineEditView(name: "Teek")
    }
}
