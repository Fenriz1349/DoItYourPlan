//
//  ProjectSucces.swift
//  DoItYourPlan
//
//  Created by apprenant49 on 13/03/2024.
//

import SwiftUI

struct ProjectSucces: View {
    let imageName: String
    let levelTitle: String
    let subtitle: String
    let categoryTitle: String
    
    
    var body: some View {
        
        HStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(color: Color.black, radius: 4, x: 0, y: 2)
                .frame(width: 100, height: 100)
                .overlay(
                    VStack (spacing: 8){
                        Image(systemName: imageName)
                            .font(.system(size: 40))
                            .foregroundColor(Color.black)
                        
                        Text(levelTitle)
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                        
                    })
            
            VStack( alignment: .leading, spacing: 8){
                Text(subtitle)
                    .font(.system(size: 24))
                Text(categoryTitle)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
            }
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }.padding(25)}
}
#Preview {
    ProjectSucces(imageName: "medal.fill", levelTitle: "NIVEAU 1", subtitle: "Volonté de fer", categoryTitle: "EN PEINTURE")
}
