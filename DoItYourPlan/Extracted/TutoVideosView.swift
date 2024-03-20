//
//  TutoView.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 14/03/2024.
//

import SwiftUI
import WebKit


struct TutoVideosView: View {
    @State var showYoutube : Bool = false
    @State var indexSelectedVideo : Int = 0
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var listYoutubeComponant : [YoutubeComponent] = [
        YoutubeComponent(id: "ViSl8ZTYflU", name: "Coudre une panière pour lingettes - Tuto couture pour débutant - zéro déchet"),
        YoutubeComponent(id: "0e4jzw34ZUk", name: "On coud le sac Clémence ensemble ! (Tutoriel couture 🪡)"),
        YoutubeComponent(id: "Offt9MPyRpo", name: "✩01 - Savoir coudre à la main [DÉBUTANT]"),
        YoutubeComponent(id: "uX5ZYSWktnQ", name: "LES BASES DE LA COUTURE | APPRENDRE À COUDRE PART.1"),
        YoutubeComponent(id: "Hi5eT5Rv7Gk", name: "7 trucs et astuces de couture intelligents / Technique de couture pour les débutants #37")
    ]
    var body: some View {
        ZStack{
            VStack{
                ScrollView{
                    LazyVGrid(columns : columns){
                        ForEach (Array(listYoutubeComponant.enumerated()), id: \.element.id) { index, component in
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color(CustomColorPostIT.purpleC.rawValue), lineWidth: 1)
                                    )
                                VStack{
                                    Button {
                                        indexSelectedVideo = index
                                        showYoutube.toggle()
                                    } label: {
                                        AsyncImage(url: URL(string: component.miniatureLink()))
                                        { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                            
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .padding(.top,5)
                                    Text(component.name)
                                        .lineLimit(2)
                                        .font(.system(size: 16))
                                }
                                .padding(10)
                            }
                            .padding(5)
                        }
                    }
                    Button {
    //                    showAddContent.toggle()
                    } label: {
                        HStack{
                            Image(systemName: "plus.circle")
                                .font(.system(size: 24))
                        }
                    }
                    .buttonStyle(PressableButtonStylesIcone(width: 45, color: .green))
                }
            }
            if showYoutube {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black.opacity(0.75))
                VStack{
                    YoutubeView(youtubeLink: listYoutubeComponant[indexSelectedVideo].videoLink())
                        .padding(.bottom,30)
                    
                    Button {
                        indexSelectedVideo = 0
                        showYoutube.toggle()
                    } label: {
                        Text("fermer")
                            .font(.system(size: 24))
                    }
                }
            }
        }
    }
}
#Preview {
    TutoVideosView()
}
