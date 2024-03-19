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
                .padding(.horizontal, 152)
                .padding(.vertical, 10)
                .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding(.top,-90)
            
            Text("Bonjour ! Craft Génius")
                .font(.title)
                .fontWeight(.bold)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Text ("Termines un projet en cours pour passer au niveau supérieur et progresser !")
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding(.bottom, 25)
            ZStack{
                RoundedRectangle (cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.purpleCustom)
                    .frame(width: 380, height: 100)
                    .padding(.bottom, 15)
                HStack{
                
                    VStack{
                        Text("Projet 1")
                            .multilineTextAlignment(.leading)
                        Text("Couture")
                    }
                    ZStack{
                        Text("70%")
                            .padding(.leading, 150)
                    }
                }
            }
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
            ZStack{
                RoundedRectangle (cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(.pinkCustom)
                    .frame(width: 380, height: 100)
                HStack{
                
                    VStack{
                        Text("Projet 3")
                            .multilineTextAlignment(.leading)
                        Text("Peinture")
                    }
                    ZStack{
                        Text("70%")
                            .padding(.leading, 150)
                    }
                }
            }
            Image(systemName: "plus.circle")
                .font(.system(size: 24))
                .padding(.top, 10)
        }
    }
}

#Preview {
    ProjectsScreen()
}
