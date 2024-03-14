//
//  PlanningScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct PlanningScreen: View {
    var body: some View {
        NavigationStack{
            Text("Planning")
                .frame(maxWidth: .infinity, alignment: .top)
                .font(.system(size: 24))
                .padding(.bottom,20)
            CalendarView()
                .padding(.bottom,20)
            ScrollView{
                ForEach (projectsProgressList) {projet in
                    NavigationLink(destination : SelectedProjectScreen()) {
                        ExtPlanningProjectProgress(project: projet)
                    }
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

#Preview {
    PlanningScreen()
}
