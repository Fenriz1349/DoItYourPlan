//
//  ExtPlanningProjectProgress.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 13/03/2024.
//

import SwiftUI
import Charts

struct ExtPlanningProjectProgress: View {
    var project : PlanningProjectProgress
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.white)
                .frame(width: 325,height: 90)
            HStack{
                ExtPiePercentCompleted(percent: project.progressPercent)
                VStack(alignment: .leading){
                        Text("\(project.name) de \(project.category.rawValue)")
                        .bold()
                    if let date = project.dateEnd {
                        Text("à terminer pour le \(formattedDatePlanning(date))")
                    }else {
                        Text("à finir quand vous voulez")
                    }
                }
                Spacer()
                Image(systemName: "chevron.right")
            }
            .foregroundStyle(Color("fontBlackCustom"))
            .frame(width: 325,height: 50)
            .padding()
            .background(Color(project.category.color()))
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .rotationEffect(Angle(degrees: project.rotation ? 2 : -2))
        }
    }
}

#Preview {
    ExtPlanningProjectProgress(project: projectsProgressList[0])
}
