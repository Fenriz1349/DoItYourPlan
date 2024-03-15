//
//  ExtPiePercentCompleted.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 13/03/2024.
//

import SwiftUI
import Charts

struct ExtPiePercentCompleted: View {
    let percent : Int
    var body: some View {
        Chart {
            SectorMark(
                angle : .value("Completion",percent),
                innerRadius: .ratio(0.75),
                angularInset: 2.0
            )
            .cornerRadius(25)
            .foregroundStyle(.green)
            SectorMark(
                angle : .value("UnCompletion",100-percent),
                innerRadius: .ratio(0.95)
            )
            .cornerRadius(25)
            .foregroundStyle(.gray)
        }
        .frame(width: 60,height: 60)
        .chartBackground { proxy in
            Text("\(percent)%")
                .font(.system(size: 14))
        }
    }
}

#Preview {
    ExtPiePercentCompleted(percent: 50)
}
