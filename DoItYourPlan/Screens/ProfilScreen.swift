//
//  ProfilScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct ProfilScreen: View {
    @Binding var userPoints: Int
    @ObservedObject var userSelections: UserSelections
    
    
    var body: some View {
        
        NavigationView {
            
            ScrollView{
                
                ZStack {
                    if let selectedBackground = userSelections.selectedBackground {
                        Color(selectedBackground.color)
                            .edgesIgnoringSafeArea(.all)
                    } else {
                        Color.white.opacity(0.5)
                            .edgesIgnoringSafeArea(.all)
                    }
                    
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color.black)
                        .padding(.top, -50)
                    Path { path in
                        path.addArc(center: CGPoint(x: 0, y: 0), radius: 90, startAngle: .degrees(180), endAngle: .degrees(0), clockwise: false)
                        path.addLine(to: CGPoint(x: 0, y: 0))
                        path.closeSubpath()
                    }
                    .frame(width: 100, height: 50)
                    .foregroundColor(Color.black)
                    .offset(x: 50, y: 150)
                    
                    
                    if let selectedColorFace = userSelections.selectedColorFace {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor( Color(selectedColorFace.color))
                            .padding(.top, -50)
                    }
                    
                    if let selectedFace = userSelections.selectedFace {
                        Image(selectedFace.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110, height: 70)
                            .offset(y: -17)
                        
                    }
                    if let selectedHair = userSelections.selectedHair {
                        Image(selectedHair.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 100)
                            .offset(y: -55)
                        
                    }
                    if let selectedHat = userSelections.selectedHat {
                        Image(selectedHat.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 100)
                            .offset(y: -80)
                    }
                    if let selectedClothe = userSelections.selectedClothe {
                        Path { path in
                            path.addArc(center: CGPoint(x: 0, y: 0), radius: 90, startAngle: .degrees(180), endAngle: .degrees(0), clockwise: false)
                            path.addLine(to: CGPoint(x: 0, y: 0))
                            path.closeSubpath()
                        }
                        .frame(width: 100, height: 50)
                        .foregroundColor( Color(selectedClothe.color))
                        .offset(x: 50, y: 150)
                    }
                    
                    if let selectedAccessory = userSelections.selectedAccessory {
                        Image(selectedAccessory.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 80)
                            .offset(x: -130, y: 85)
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 270).background(Color.white.opacity(0.5))
                
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
                            
                            Text("\(userPoints)")
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
                        ProjectButtons(iconName: "arrow.counterclockwise", projectNumber: 3, projectTitle: "Projets en cours")
                    }
                    
                    NavigationLink(destination: FinishedProjectScreen()) {
                        ProjectButtons(iconName: "checkmark.rectangle.stack", projectNumber: 4, projectTitle: "Projets terminés")
                    }
                }.buttonStyle(PressableButtonStylesCustom(color: Color(CustomColor.purpleC.rawValue)))
                
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
            }.navigationBarTitle("Profil", displayMode: .inline)
                .navigationBarItems(
                    leading: NavigationLink(destination: SettingsScreen()) {
                        Image(systemName: "gearshape").font(.system(size: 22)).foregroundColor(.black)
                    },
                    trailing: NavigationLink(destination: ShopScreen(userSelections: userSelections, userPoints: $userPoints)) {
                        HStack {
                            Text("Shop")
                            Image(systemName: "chevron.right")
                        }.foregroundColor(.black)
                    }
                )
            
        }
    }
}

#Preview {
   
    ProfilScreen(userPoints: .constant(250), userSelections: userSelections)
}
