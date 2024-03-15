//
//  ExtPostIt.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 15/03/2024.
//

import SwiftUI

struct ExtPostIt: View {
    @Binding var postit : PostIt
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(postit.color.rawValue))
                .frame(width: 150,height: 150)
            VStack{
                Text(postit.name)
                    .underline(true, color: .black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom,5)
                ForEach(postit.contents, id: \.self) {content in
                    HStack{
                        Text("- \(content)")
                        Spacer()
                    }
                }
                Spacer()
            }
        }
        .frame(width: 150,height: 150)
        .onTapGesture {
            
        }
        
    }
}

#Preview {
    ExtPostIt(postit: .constant(PostIt(name: "Test 1", color: .yellowC, contents: ["ça marche bien","Et oui Gael"])))
}
