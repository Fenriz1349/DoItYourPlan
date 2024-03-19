//
//  detailsFinishedProjectsScreen.swift
//  DoItYourPlan
//
//  Created by Amina on 19/03/2024.
//

import SwiftUI

struct detailsFinishedProjectsScreen: View {
    var body: some View {
        VStack{
            Text("Détails Projet")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 142.0)
                .padding(.vertical, 10)
                .border(Color.gray, width: 1)
            ScrollView{
                Spacer()
                    .frame(height: 30)
                Text ("🎊 Bravo Craft Genius ! 🎊 ")
                Text ("Projet réalisé en 6 semaines, comme prévu ! ")
                Spacer()
                    .frame(height: 50)
                
                    Image("cosplayGirl1")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(20)
                    Image("cosplayGirl2")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(20)
                
                Spacer()
                    .frame(height: 30)
                
                Text("Partage ta création sur tes réseaux sociaux 📱")
                
                
            }
        }
    }
}

#Preview {
    detailsFinishedProjectsScreen()
}
