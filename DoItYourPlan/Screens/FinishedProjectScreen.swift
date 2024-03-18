//
//  FinishedProjectScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct FinishedProjectScreen: View {
    var body: some View {
        VStack{
            Text("Retour")
                .navigationTitle("ProfilScreen")
                .navigationBarBackButtonHidden(true)
                .padding(.leading, -150.0)
                .padding(.top, -350)
            
            ZStack{
                RoundedRectangle (cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.blueCustom)
                    .frame(width: 380, height: 100)
                    .padding(.bottom, 15)
                HStack{
                    VStack{
                        Text("Projet 2")
                            .multilineTextAlignment(.leading)
                        Text("Crochet")
                    }
                    ZStack{
                        Text("70%")
                            .padding(.leading, 150)
                    }
                }
            }
        }
    }
}
#Preview {
    FinishedProjectScreen()
}
