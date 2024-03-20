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
                        if differenceInDays(from: Date(), to: date) == 0 {
                            Text("à finir aujourd'hui")
                        }else if differenceInDays(from: Date(), to: date) > 0{
                            Text("à terminer pour le \(formattedDatePlanning(date))")
                            Text("dans \(differenceInDays(from: Date(), to: date)) jours")
                        }
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
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

#Preview {
    ExtPlanningProjectProgress(project: projectsProgressList[0])
}
