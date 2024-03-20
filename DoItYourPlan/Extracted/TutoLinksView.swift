//
//  TutoLinks.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 20/03/2024.
//

import SwiftUI

struct TutoLinksView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
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
        
        ScrollView{
            ForEach (listTutosLink) {component in
                HStack{
                    Image(component.icone)
                    Link(component.name,destination: URL(string :component.url)!)
                    Spacer()
                }
                .padding(.leading,20)
            }
            Button {
//                showAddContent.toggle()
            } label: {
                HStack{
                    Image(systemName: "plus.circle")
                        .font(.system(size: 24))
                }
            }
            .buttonStyle(PressableButtonStylesIcone(width: 45, color: .green))
        }
    }
}

#Preview {
    TutoLinksView()
}
