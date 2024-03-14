//
//  ProjectsScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct ProjectsScreen: View {
    var body: some View {
        VStack{
            Text("Mes projets")
                .padding(.horizontal, 150)
                .padding(.vertical, 10)
                .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            
            Text("Bonjour ! Craft Génius")
                .font(.title)
                .fontWeight(.bold)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Text ("Termines un projet en cours pour passer au niveau supérieur et progresser !")
                .fontWeight(.light)
                .multilineTextAlignment(.center)
            ZStack{
                RoundedRectangle (cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.purpleCustom)
                    .frame(width: 380, height: 100)
                HStack{
                Text("70%")
                    VStack{
                        Text("Projet 1")
                            .multilineTextAlignment(.leading)
                        Text("Couture")
                    }
                }
            }
            ZStack{
                RoundedRectangle (cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.blueCustom)
                    .frame(width: 380, height: 100)
                HStack{
                Text("70%")
                    VStack{
                        Text("Projet 2")
                            .multilineTextAlignment(.leading)
                        Text("Crochet")
                    }
                }
            }
            ZStack{
                RoundedRectangle (cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.pinkCustom)
                    .frame(width: 380, height: 100)
                HStack{
                Text("70%")
                    VStack{
                        Text("Projet 2")
                            .multilineTextAlignment(.leading)
                        Text("Peinture")
                    }
                }
            }
        }
    }
}

#Preview {
    ProjectsScreen()
}
