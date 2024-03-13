//
//  ProfilScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct ProfilScreen: View {
    @State private var isPressed = false
    var body: some View {
        
        ScrollView{
            VStack {
                VStack{
                HStack {
                    Button(action: {
                        // Action pour le bouton des paramètres
                    }) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                            .padding()
                    }
                    Spacer()
                    Button(action: {
                        // Action pour le lien vers le shop
                    }) {
                        HStack {
                            Text("Shop")
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(.black)
                        .padding()
                    }
                }
                
             
                
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                    Divider()
                }.background(Color("yellowColor"))
             
                
                
                Text("CraftGenius")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.leading, -170)
                
                
                
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                        .shadow(color: Color.black, radius: 4, x: 0, y: 2)
                    
                    .frame(width: 170, height: 50)
                    .overlay(
                        HStack {
                            Image(systemName: "leaf")
                                .font(.system(size: 24))
                            
                                .padding(.trailing, 5)
                            VStack (alignment: .leading){
                                Text("100")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                Text("Points gagnés")
                                    .font(.system(size: 16))
                            }
                        }
                        
                    ) .padding(.leading, -170)
                
                
                
                Divider().padding(.top, 20)
                
                Text("Projet")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.top, 15)
                    .padding(.leading, -170)
                
                HStack {
                    Button(action: {
                        // Action à effectuer lors du clic sur le bouton
                    }) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(color: Color.black, radius: 4, x: 0, y: 2)
                        
                            .frame(width: 170, height: 50)
                            .overlay(
                                HStack {
                                    Image(systemName: "arrow.counterclockwise")
                                        .font(.system(size: 24))
                                        .padding(.trailing, 3)
                                    VStack (alignment: .leading){
                                        Text("3")
                                            .font(.system(size: 16))
                                            .fontWeight(.bold)
                                        Text("Projets en cours")
                                            .font(.system(size: 16))
                                    }
                                }
                                
                            )
                    }.buttonStyle(PlainButtonStyle())
                    Button(action: {
                        // Action à effectuer lors du clic sur le bouton
                        self.isPressed.toggle()
                    }) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(isPressed ? Color.gray : Color.white)
                            .shadow(color: Color.black, radius: 4, x: 0, y: 2)
                        
                            .frame(width: 170, height: 50)
                            .overlay(
                                HStack {
                                    Image(systemName: "checkmark.rectangle.stack")
                                        .font(.system(size: 24))
                                        .padding(.trailing, 3)
                                    VStack (alignment: .leading){
                                        Text("3")
                                            .font(.system(size: 16))
                                            .fontWeight(.bold)
                                        Text("Projets terminés")
                                            .font(.system(size: 16))
                                    }
                                }
                                
                            )
                    }
                }.buttonStyle(PlainButtonStyle())
                Text("Succès")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .padding(.top, 15)
                    .padding(.leading, -170)
                
                
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: 350, height: 540)
                    .overlay(
                        
                        VStack (alignment: .leading, spacing: 25){
                            
                            HStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .shadow(color: Color.black, radius: 4, x: 0, y: 2)
                                    .frame(width: 100, height: 100)
                                    .overlay(
                                        VStack (spacing: 8){
                                            Image(systemName: "medal")
                                                .font(.system(size: 40))
                                               
                                            Text("NIVEAU 1")
                                                .font(.system(size: 16))
                                                .fontWeight(.bold)
                                            
                                        }) .padding(.leading, 20)
                                
                                VStack(spacing: 8){
                                    Text("Volonté de fer")
                                        .font(.system(size: 24))
                                    RoundedRectangle(cornerRadius: 10)
                                           .fill(Color("orangeColor"))                       .frame(width: 180, height: 50)
                                           .overlay(
                                               RoundedRectangle(cornerRadius: 10)
                                                   .stroke(Color.black, lineWidth: 1)
                                                   .frame(width: 180, height: 50)
                                           )
                                    .overlay(
                                            Text("EN PEINTURE")
                                                .font(.system(size: 24))
                                                .fontWeight(.bold)
                                            
                                    )

                                      
                                }.padding(.leading, 20)
                                    
                            }
                           
                       
                            Divider()
                            HStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                        .shadow(color: Color.black, radius: 4, x: 0, y: 2)
                                    .frame(width: 100, height: 100)
                                    .overlay(
                                        VStack (spacing: 8){
                                            Image(systemName: "trophy")
                                                .font(.system(size: 40))
                                               
                                            Text("NIVEAU 4")
                                                .font(.system(size: 16))
                                                .fontWeight(.bold)
                                        }) .padding(.leading, 20)
                                
                                VStack(spacing: 8){
                                    Text("Légende vivante")
                                        .font(.system(size: 24))
                                    RoundedRectangle(cornerRadius: 10)
                                           .fill(Color("greenColor"))                       .frame(width: 180, height: 50)
                                           .overlay(
                                               RoundedRectangle(cornerRadius: 10)
                                                   .stroke(Color.black, lineWidth: 1)
                                                   .frame(width: 180, height: 50)
                                           )
                                           .overlay(
                                    Text("EN JARDINAGE")
                                        .font(.system(size: 24))
                                        .fontWeight(.bold)
                                        
                               ) }.padding(.leading, 20)
                            }
                            Divider()
                            HStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                        .shadow(color: Color.black, radius: 4, x: 0, y: 2)
                                    .frame(width: 100, height: 100)
                                    .overlay(
                                        VStack (spacing: 8){
                                            Image(systemName: "hands.and.sparkles")
                                                .font(.system(size: 40))
                                              
                                            Text("NIVEAU 5")
                                                .font(.system(size: 16))
                                                .fontWeight(.bold)
                                        }) .padding(.leading, 20)
                                VStack(spacing: 8){
                                    Text("Maître de l'art")
                                        .font(.system(size: 24))
                                    RoundedRectangle(cornerRadius: 10)
                                           .fill(Color("purpleColor"))                       .frame(width: 180, height: 50)
                                           .overlay(
                                               RoundedRectangle(cornerRadius: 10)
                                                   .stroke(Color.black, lineWidth: 1)
                                                   .frame(width: 180, height: 50)
                                           )
                                           .overlay(
                                    Text("EN COUTURE")
                                        .font(.system(size: 24))
                                        .fontWeight(.bold)
                                       
                                )}.padding(.leading, 20)
                                    
                            }
                            Divider()
                            HStack{
                                Text("Afficher")
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 24))
                            }.padding(.leading, 20)
                        }
                       
                    )
              
            }
            
        }
    }
}


#Preview {
    ProfilScreen()
}

