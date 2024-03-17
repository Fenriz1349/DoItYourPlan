//
//  ExtZoomPostIt.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 15/03/2024.
//

import SwiftUI

struct ExtZoomPostIt: View {
    @StateObject var postit: PostIt
    var width: CGFloat = 300
    @Binding var showPostIt: Bool
    @State private var editionContent : Bool = false
    @State private var indexEdition : Int? = nil

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(postit.color.rawValue))
                .frame(width: width, height: width)
            VStack {
                Text(postit.name)
                    .underline(true, color: .black)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                ForEach(postit.contents.indices, id: \.self) { index in
                    HStack {
                        if editionContent {
                            Button {
                                indexEdition = index
                            } label: {
                                Image(systemName: "pencil.circle")
                                    .foregroundStyle(.yellow)
                            }
                            if indexEdition == index {
                                EditablePostItContent(index: index,postitContent: $postit.contents[index],indexEdition: $indexEdition )
                            }else {
                                Text("-\(postit.contents[index])")
                                Spacer()
                                Button {
                                    postit.contents.remove(at: index)

                                } label: {
                                    Image(systemName: "trash.fill")
                                        .foregroundStyle(.red)
                                }
                            }
                        } else {
                            Text("-\(postit.contents[index])")
                                .offset(CGSize(width: 30.0, height: 0.0))
                            Spacer()
                        }
                    }
                }
                Spacer()
            }
            .frame(width: width,height: width)
                            .font(.system(size: 24))
//                            .position(x: 175, y: 175)
            VStack {
                HStack {
                    Button {
                        editionContent.toggle()
                    } label: {
                        Spacer()
                        Image(systemName: "pencil.circle")
                        Text("Modifier")
                            .font(.system(size: 24))
                    }
                    .foregroundStyle(.yellow)
                    Button {
                        postit.isShowed.toggle()
                        showPostIt.toggle()
                    } label: {
                        Spacer()
                        Image(systemName: "trash.fill")
                        Text("Supprimer")
                            .font(.system(size: 24))
                    }
                    .foregroundColor(.red)
                    .padding(.bottom, 5)
                }
                Spacer()
                Button {
                    showPostIt.toggle()
                } label: {
                    Text("retour")
                        .font(.system(size: 24))
                }
            }
            .frame(width: 350, height: 375)
        }
    }
}



#Preview {
    ExtZoomPostIt(postit: (PostIt(name: "Post it 1", color: CustomColor.blueC, contents: ["ligne 1","ligne 2"])),showPostIt: .constant(true))
}
