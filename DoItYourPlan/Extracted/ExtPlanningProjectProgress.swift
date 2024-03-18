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
        HStack{
            Chart {
                SectorMark(
                    angle : .value("Completion",project.progressPercent),
                    innerRadius: .ratio(0.75),
                    angularInset: 2.0
                )
                .cornerRadius(25)
                .foregroundStyle(.green)
                SectorMark(
                    angle : .value("Completion",100-project.progressPercent),
                    innerRadius: .ratio(0.95)
                )
                .cornerRadius(25)
                .foregroundStyle(.gray)
            }
            .frame(width: 60,height: 60)
            .chartBackground { proxy in
                Text("\(project.progressPercent)%")
                    .font(.system(size: 14))
            }
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
        
    }
}

#Preview {
    ExtPlanningProjectProgress(project: projectsProgressList[0])
}
