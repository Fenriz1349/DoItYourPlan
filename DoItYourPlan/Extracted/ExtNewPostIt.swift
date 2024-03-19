//
//  ExtZoomPostIt.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 15/03/2024.
//

import SwiftUI

struct ExtNewPostIt: View {
    var postitlist : PostItList
    @StateObject var postit: PostIt = PostIt(name: "Titre",x: 175,y: 175 ,color: .blueC, contents: [])
    var width: CGFloat = 300
    @Binding var showPostIt: Bool
    @State private var showAddContent : Bool = false
    @State private var indexEdition : Int? = nil
    @State private var indexName  : Int? = nil
    @State private var selectedColor: CustomColorPostIT = .purpleC
    
    var body: some View {
        ZStack {
//            arrière plan du zoom sur le post it
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color("blackCustom").opacity(0.8), Color.gray.opacity(0.5)]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                .frame(width: 375,height: 450)
//                fond du post It de sa propre couleur
            Rectangle()
                .fill(Color(postit.color.rawValue))
                .frame(width: width, height: width)
            VStack {
//                titre du post it
                HStack{
                        Button {
                            indexName = 0
                        } label: {
                            Image(systemName: "pencil.circle")
                                .foregroundStyle(.yellow)
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
                    Picker("Couleur", selection: $selectedColor) {
                        ForEach(CustomColorPostIT.allCases, id: \.self) { color in
                            Text(color.color())
                                .foregroundColor(Color(CustomColor.blackC.rawValue))
                        }
                    }
                    .pickerStyle(.menu)
                        .padding()
                        .scaleEffect(1.5)
                        .onChange(of: selectedColor) {
                            postit.color = selectedColor
                        }
                    Spacer()
//                    bouton pour annuler la création
                    Button {
                        showPostIt.toggle()
                    } label: {
                        Spacer()
                        Image(systemName: "clear.fill")
                        Text("Annuler")
                            .font(.system(size: 24))
                    }
                    .foregroundColor(.red)
                    .padding(.trailing,10)
                }
                .offset(CGSize(width: 0.0, height: -40.0))
                Spacer()
                Button {
                    postitlist.addPostIt(postit)
                    showPostIt.toggle()
                } label: {
                    HStack{
                        Image(systemName: "plus.app.fill")
                        Text("Valider")
                    }
                    .font(.system(size: 24))
                    
                }
            }
            .frame(width: 350, height: 375)
        }
    }
}

#Preview {
    ExtNewPostIt(postitlist: PostItList(), showPostIt: .constant(true))
}
