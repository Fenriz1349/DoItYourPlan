//
//  ExtPostIt.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 15/03/2024.
//

import SwiftUI

struct ExtPostIt: View {
    var width : CGFloat = 150
    @Binding var postit : PostIt
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(postit.color.rawValue))
                .frame(width: width,height: width)
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
        .frame(width: width,height: width)
        .rotationEffect(Angle(degrees: postit.rotation))
        
    }
}

#Preview {
    ExtPostIt(postit: .constant(PostIt(name: "Test 1", color: .yellowC, contents: ["ça marche bien","Et oui Gael"])))
}
