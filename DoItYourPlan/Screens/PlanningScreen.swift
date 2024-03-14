//
//  PlanningScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct PlanningScreen: View {
    var body: some View {
        VStack{
            Text("Planning")
                .frame(maxWidth: .infinity, alignment: .top)
            Spacer()
            Text("Projet 1 à terminer pour le \(formattedDate(ListDateEndProjects[0] ?? Date()))")
           
        }
    }
}

#Preview {
    PlanningScreen()
}
