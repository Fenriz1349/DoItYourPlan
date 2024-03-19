//
//  LibraryScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct LibraryScreen: View {
    @State private var segmentedSelection = 0
    var body: some View {
        VStack{
            Text("Bibliothèque")
                .font(.system(size: 24))
                .bold()
                .padding(.bottom,5)
            Picker("", selection: $segmentedSelection) {
                Text("Inspirations").tag(0)
                Text("Tutos").tag(1)
            }
            .pickerStyle(.segmented)
            if segmentedSelection == 0 {
                InspirationView()
            }else {
                TutoView()
            }
            Spacer()
        }
    }
}

#Preview {
    LibraryScreen()
}
