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
    @State private var showAddContent : Bool = false
    @State private var indexEdition : Int? = nil
    @State private var indexName  : Int? = nil

    var body: some View {
        ZStack {
//            arrière plan du zoom sur le post it
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.5))
                .frame(width: 375,height: 450)
//                fond du post It de sa propre couleur
            Rectangle()
                .fill(Color(postit.color.rawValue))
                .frame(width: width, height: width)
            VStack {
//                titre du post it
                HStack{
                    if editionContent {
                        Button {
                            indexName = 0
                        } label: {
                            Image(systemName: "pencil.circle")
                                .foregroundStyle(.yellow)
                        }
                    }
                    if indexName != nil  {
                        EditablePostItContent( postitContent: $postit.name, indexEdition: $indexName)
                    }else {
                        Text(postit.name)
                            .underline(true, color: .black)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 5)
                    }
                }
//                peuplement de toutes les lignes du postIt
                ForEach(postit.contents.indices, id: \.self) { index in
                    HStack {
//                        si on est en mode edition affiche le bouton pour modifier la ligne
                        if editionContent {
                            Button {
                                indexEdition = index
                            } label: {
                                Image(systemName: "pencil.circle")
                                    .foregroundStyle(.yellow)
                            }
                            .offset(CGSize(width: -30.0, height: 0.0))
//                            si on modifie la ligne on affiche le TextField
                            if indexEdition == index {
                                EditablePostItContent(postitContent: $postit.contents[index],indexEdition: $indexEdition )
                            }else {
//                                affichage de la ligne et du bouton pour supprimer cette ligne
                                Text("-\(postit.contents[index])")
                                Spacer()
                                Button {
                                    postit.contents.remove(at: index)

                                } label: {
                                    Image(systemName: "trash.fill")
                                        .foregroundStyle(.red)
                                }
                                .offset(CGSize(width: 30.0, height: 0.0))
                            }
                        } else {
//                            affichage de la ligne si on est pas en mode edition
                            Text("-\(postit.contents[index])")
                                .offset(CGSize(width: 30.0, height: 0.0))
                            Spacer()
                        }
                    }
                }
//                si on a clicé sur le bouton d'ajouter affichage de l'Ext pour ajouter une ligne
                if showAddContent {
                    AddPostItContent(postit: postit,showAddContent: $showAddContent)
                }else {
//                    bouton pour ajouter une ligne sur le post It
                    Button {
                        showAddContent.toggle()
                    } label: {
                        Image(systemName: "plus.app.fill")
                        Text("Ajouter")
                            .font(.system(size: 24))
                    }
                    .foregroundColor(.green)
                }
                Spacer()
            }
            .frame(width: width,height: width)
                            .font(.system(size: 24))
            VStack {
                HStack {
//                    bouton pour activer le mode edition du post it
                    Button {
                        editionContent.toggle()
                    } label: {
                        Image(systemName: "pencil.circle")
                        Text("Modifier")
                            .font(.system(size: 24))
                    }
                    .foregroundStyle(.yellow)
                    Spacer()
//                    bouton pour supprimer le postIt
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
                    .padding(.trailing,10)
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
    ExtZoomPostIt(postit: (PostIt(name: "Post it 1", color: CustomColorPostIT.blueC, contents: ["ligne 1","ligne 2"])),showPostIt: .constant(true))
}
