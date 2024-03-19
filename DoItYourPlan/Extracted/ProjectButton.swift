//
//  ProjectButton.swift
//  DoItYourPlan
//
//  Created by apprenant49 on 13/03/2024.
//

import SwiftUI

struct ProjectButton: View {
    let iconName: String
    let projectNumber: Int
    let projectTitle : String
    
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20)
            .fill(Color("yellowCustom"))
            .shadow(color: Color.black, radius: 4, x: 0, y: 2)
            .frame(width: 170, height: 50)
            .overlay(
                HStack {
                    Image(systemName: iconName)
                        .font(.system(size: 24))
                    
                    VStack(alignment: .leading) {
                        Text("\(projectNumber)")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                        Text(projectTitle)
                            .font(.system(size: 16))
                    }
                }
            )
        
        
    }
    
}
#Preview {
    ProjectButton(iconName: "arrow.counterclockwise", projectNumber: 3, projectTitle: "Projets en cours")
}
