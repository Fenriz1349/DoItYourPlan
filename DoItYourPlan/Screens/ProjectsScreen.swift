//
//  ProjectsScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct ProjectsScreen: View {
    @State var showNewProjet : Bool = false
    
    var body: some View {
        NavigationStack {
            
            Text("Bonjour ! Craft Génius")
                .font(.title)
                .fontWeight(.bold)
                .padding(.all)
                .frame(width: 340)
            
            
            Text("Termine un projet en cours pour passer au niveau supérieur et progresser !")
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .padding(.bottom, 25)
                .frame(width: 340)
                .foregroundColor(.gray)
            ScrollView {
                
                NavigationLink(destination: SelectedProjectScreen()) {
                    projectRectangle(title: "Robe vintage à motifs floraux", subtitle: "Couture", color: .purpleCustom, percent: 90)
                }
                NavigationLink(destination:SelectedProjectScreen2()){
                    projectRectangle(title: "Plaid bohème multicolore", subtitle: "Crochet", color: .pinkCustom, percent: 70)
                }
                projectRectangle(title: "Paysage marin au coucher du soleil", subtitle: "Peinture", color: .blueCustom, percent: 25)
                
                if showNewProjet {
                    projectRectangle(title: "Jardin aromatique en carrés", subtitle: "Jardinage", color: .greenCustom, percent: 0)
                }
                NavigationLink(destination: NewProjectScreen(showNewProjet: $showNewProjet)) {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 50))
                        .padding(.top, 10)
                        .foregroundStyle(.black)
                }
            }
            .navigationTitle("Mes projets")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProjectsScreen()
}

func projectRectangle(title: String, subtitle: String, color: Color, percent: Int) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(color)
                .frame(width: 340, height: 100)
                .padding(.bottom, 15)
HStack {
                VStack(alignment: .leading) {
                    Text(title)
                    Text(subtitle)
                }
                .padding(.leading, 40)

                Spacer()

                ExtPiePercentCompleted(percent: percent)
                    .padding(.trailing, 40)
            }
            .foregroundStyle(.black)
        }
    }

