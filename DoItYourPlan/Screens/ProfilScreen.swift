//
//  ProfilScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct ProfilScreen: View {
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                HStack {
                    NavigationLink(destination: SettingsScreen()) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                            .padding()
                    }
                    
                    Spacer()
                    Text("Profil")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Spacer()
                    NavigationLink(destination: ShopScreen()) {
                        HStack {
                            Text("Shop")
                            Image(systemName: "chevron.right")
                        }
                        .foregroundColor(.black)
                        .padding()
                    }
                }.padding(.bottom,  -10)
                ScrollView{
                    VStack(spacing: -3) {
                        
                        Circle()
                            .frame(width: 100, height: 100)
                        
                        Path { path in
                            path.addArc(center: CGPoint(x: 0, y: 0), radius: 90, startAngle: .degrees(180), endAngle: .degrees(0), clockwise: false)
                            path.addLine(to: CGPoint(x: 0, y: 0))
                            path.closeSubpath()
                        }
                        .frame(width: 100, height: 50)
                        .offset(x: 50, y: 100)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 300).background(Color("yellowCustom"))
                    
                    
                    
                    Text("CraftGenius")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(color: Color.black, radius: 4, x: 0, y: 2)
                        .frame(width: 120, height: 100)
                        .overlay(
                            VStack (spacing: 5){
                                Image(systemName: "leaf.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(Color.black)
                                
                                Text("100")
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                                Text("Points gagnés")
                                    .font(.system(size: 16))
                                
                            })
                    
                    Divider().padding(.top, 20)
                    
                    Text("Projet")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .padding(.top, 15)
                        .padding(.leading, -170)
                    
                    HStack {
                        NavigationLink(destination: ProjectsScreen()) {
                            ProjectButton(iconName: "arrow.counterclockwise", projectNumber: 3, projectTitle: "Projets en cours")
                        }
                        
                        NavigationLink(destination: FinishedProjectScreen()) {
                            ProjectButton(iconName: "checkmark.rectangle.stack", projectNumber: 4, projectTitle: "Projets terminés")
                        }
                    }.buttonStyle(PlainButtonStyle())
                    
                    Text("Succès")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .padding(.top, 15)
                        .padding(.leading, -170)
                    
                    VStack(spacing: 0) {
                        UnevenRoundedRectangle(cornerRadii: .init(
                            topLeading: 20,
                            bottomLeading: 0,
                            bottomTrailing: 0,
                            topTrailing: 20),
                                               style: .continuous)                        .fill(Color("orangeCustom"))
                            .stroke(Color.black)
                            .frame(width: 350, height: 130)
                            .overlay(
                                ProjectSucces(imageName: "medal.fill", levelTitle: "NIVEAU 1", subtitle: "Volonté de fer", categoryTitle: "EN PEINTURE"))
                        Rectangle()
                            .fill(Color("greenCustom"))
                            .stroke(Color.black)
                            .frame(width: 350, height: 130)
                            .overlay(
                                ProjectSucces(imageName: "trophy.fill", levelTitle: "NIVEAU 4", subtitle: "Légende vivante", categoryTitle: "EN JARDINAGE"))
                        
                        Rectangle()
                            .fill(Color("purpleCustom"))
                            .stroke(Color.black)
                            .frame(width: 350, height: 130)
                            .overlay(
                                ProjectSucces(imageName: "hands.and.sparkles.fill", levelTitle: "NIVEAU 5", subtitle: "Maître de l'art", categoryTitle: "EN COUTURE"))
                        
                        UnevenRoundedRectangle(cornerRadii: .init(
                            topLeading: 0,
                            bottomLeading: 20,
                            bottomTrailing: 20,
                            topTrailing: 0),
                                               style: .continuous)        .fill(Color("blueCustom"))
                            .stroke(Color.black)
                            .frame(width: 350, height: 130)
                            .overlay(
                                ProjectSucces(imageName: "flag.2.crossed.fill", levelTitle: "NIVEAU 1", subtitle: "Esprit d'initiative", categoryTitle: "EN DESSIN"))
                        
                    }
                }
                
                
            }}}}

#Preview {
    ProfilScreen()
}
