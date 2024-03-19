//
//  TutoView.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 14/03/2024.
//

import SwiftUI
import WebKit


struct TutoView: View {
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
    var listTutosLink : [TutoLink] = [
        TutoLink(name: "The Handicraft Hub", url: "https://thehandicrafthub.com", icone: "handicrafthub"),
        TutoLink(name: "Artisan Tutor", url: "https://thehandicrafthub.com", icone: "artisanTutor"),
        TutoLink(name: "Create It Now", url: "https://thehandicrafthub.com", icone: "createNow"),
        TutoLink(name: "Craftopia Tutorials", url: "https://thehandicrafthub.com", icone: "craftopiaTutorials"),
        TutoLink(name: "Maker Mentorship", url: "https://thehandicrafthub.com", icone: "makerMentorship"),
        TutoLink(name: "Skill Crafters", url: "https://thehandicrafthub.com", icone: "skillCrafters"),
        TutoLink(name: "Handmade How To", url: "https://thehandicrafthub.com", icone: "handmadeHowTo"),
        TutoLink(name: "Crafty Creators Hub", url: "https://thehandicrafthub.com", icone: "craftyCreatorsHub"),
        TutoLink(name: "Créa Mania", url: "https://thehandicrafthub.com", icone: "creaMania")
    ]
    var body: some View {
        ZStack{
            VStack{
                Text("Mes Tutos")
                    .font(.system(size: 24))
                    .bold()
                Divider()
                Text("Vidéos")
                    .font(.system(size: 24))
                    .bold()
                ScrollView{
                    LazyVGrid(columns : columns){
                        ForEach (Array(listYoutubeComponant.enumerated()), id: \.element.id) { index, component in
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 3)
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
                                .padding(5)
                            }
                        }
                    }
                }
                .frame(height: 400)
                Text("Liens")
                    .font(.system(size: 24))
                    .bold()
                ScrollView{
                    ForEach (listTutosLink) {component in
                        HStack{
                            Image(component.icone)
                            Link(component.name,destination: URL(string :component.url)!)
                            Spacer()
                        }
                        .padding(.leading,20)
                    }
                }
            }
            if showYoutube {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black.opacity(0.75))
                    .frame(width: 375,height: 375)
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
    TutoView()
}