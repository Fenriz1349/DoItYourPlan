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
                Image("coussinRecycle")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                Text ("Bravo Craft Genius !")
                Text ("Projet en 6 semaines, comme prévu ! ")
            }
        }
    }
}

#Preview {
    detailsFinishedProjectsScreen()
}
