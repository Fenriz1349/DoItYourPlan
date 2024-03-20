//
//  AddPostItContent.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 17/03/2024.
//

import SwiftUI

struct AddPostItContent: View {
    @StateObject var postit : PostIt
    @Binding var showAddContent : Bool
    @State private var newContent: String = ""
    
    var body: some View {
        HStack {
            ZStack{
                TextField("max 50 caractères", text: $newContent)
            }
            Button {
                if newContent != ""{
                    postit.contents.append(newContent)
                }
                showAddContent.toggle()
            } label: {
                Image(systemName: "checkmark.circle")
                
            }
            .buttonStyle(PressableButtonStylesIcone(width: 40, color: .green))
            
        }
    }
}
