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
    let listYoutubeComponant : [YoutubeComponent] = [
        YoutubeComponent(id: "ViSl8ZTYflU", name: "Coudre une panière pour lingettes - Tuto couture pour débutant - zéro déchet"),
        YoutubeComponent(id: "0e4jzw34ZUk", name: "On coud le sac Clémence ensemble ! (Tutoriel couture 🪡)")
    ]
    var body: some View {
        ZStack{
            VStack{
                Text("Vos Tutos")
                    .font(.system(size: 24))
                    .bold()
                ScrollView{
                    LazyVGrid(columns : columns){
                        ForEach (Array(listYoutubeComponant.enumerated()), id: \.element.id) { index, component in
                            Button {
                                indexSelectedVideo = index
                                showYoutube.toggle()
                            } label: {
                                AsyncImage(url: URL(string: component.miniatureLink()))
                                { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 175, height: 125)
                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                    }
                }
            }
            if showYoutube {
                VStack{
                    YoutubeView(youtubeLink: listYoutubeComponant[indexSelectedVideo].videoLink())
                    
                    Button {
                        indexSelectedVideo = 0
                        showYoutube.toggle()
                    } label: {
                        Text("fermer")
                    }
                }
            }
        }
    }
}
#Preview {
    TutoView()
}
