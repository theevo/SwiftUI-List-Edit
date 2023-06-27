//
//  NavView.swift
//  SwiftUI List Edit
//
//  Created by Theo Vora on 6/27/23.
//

import SwiftUI

struct NavView: View {
    var body: some View {
        NavigationView {
            SingleLineEditView()
        }
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
