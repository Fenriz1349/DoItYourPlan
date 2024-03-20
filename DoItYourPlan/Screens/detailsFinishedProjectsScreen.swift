//
//  detailsFinishedProjectsScreen.swift
//  DoItYourPlan
//
//  Created by Amina on 19/03/2024.
//

import SwiftUI

struct detailsFinishedProjectsScreen: View {
    var body: some View {
        NavigationStack{
                ScrollView{
                    Spacer()
                        .frame(height: 30)
                    Text ("🎊 Bravo Craft Genius ! 🎊 ")
                        .fontWeight(.bold)
                    Text ("Projet réalisé en 6 semaines, comme prévu ! ")
                    Spacer()
                        .frame(height: 20)
                    Image("cosplaygirl1")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(20)
                    Image("cosplayGirl2")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(20)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Text("Partage ton DIY sur tes réseaux sociaux:")
                    
                    HStack{
                        Image("logoFacebook")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Image("logoInstagram")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Image("logoPinterest")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Image("logoWhatsapp")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                } .navigationBarTitle("Détails projets", displayMode: .inline)
            }
        
    }
}
#Preview {
    detailsFinishedProjectsScreen()
}
