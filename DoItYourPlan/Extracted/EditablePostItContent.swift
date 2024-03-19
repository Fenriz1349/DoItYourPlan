//
//  EditablePostItContent.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 17/03/2024.
//

import SwiftUI

struct EditablePostItContent: View {
    @Binding var postitContent: String
    @Binding var indexEdition : Int?
    @State private var newContent: String = ""
    
    init(postitContent: Binding<String>, indexEdition: Binding<Int?>) {
            self._postitContent = postitContent
            self._indexEdition = indexEdition
            self._newContent = State(initialValue: postitContent.wrappedValue)
        }
    
    var body: some View {
        HStack {
            ZStack{
                TextField("Enter text", text: $newContent)
            }
            Button {
                indexEdition = nil
                postitContent = newContent
                newContent = ""
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.green)
                    
            }
        }
    }
}

