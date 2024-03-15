//
//  ExtZoomPostIt.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 15/03/2024.
//

import SwiftUI

struct ExtZoomPostIt: View {
    var width : CGFloat = 300
    @Binding var postit : PostIt
    @Binding var showPostIt : Bool
    var body: some View {
        ZStack{
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
                .font(.system(size: 24))
                .position(x: 175, y: 190)
            VStack{
                HStack{
                    Spacer()
                    Button {
                        postit.isShowed.toggle()
                        showPostIt.toggle()
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                        Text("Supprimer")
                            .bold()
                    }
                    .padding(.bottom,5)
                }
                .font(.system(size: 24))
                .foregroundStyle(.red)
                Spacer()
                Button {
                    showPostIt.toggle()
                } label: {
                    Text("retour")
                        .font(.system(size: 24))
                }
            }
        }
        .frame(width: 350,height: 375)
    }
}

#Preview {
    ExtZoomPostIt(postit: .constant(PostIt(name: "Post it 1", color: CustomColor.blueC, contents: ["ligne 1","ligne 2"])),showPostIt: .constant(true))
}
