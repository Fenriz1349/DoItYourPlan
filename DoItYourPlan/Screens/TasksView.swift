//
//  TasksView.swift
//  DoItYourPlan
//
//  Created by Aurélien Chevalier on 14/03/2024.
//

import SwiftUI

struct TasksView: View {
    let pebble: String
    
    var body: some View {
        if let step = myProject.steps.first(where: { $0.id.uuidString == pebble }) {
            HStack {
                Text(step.stepName)
                ZStack {
                    Circle()
                        .fill(step.stepColor.gradient)
                    Text("Etape \(step.orderNumber)")
                        .foregroundColor(.white)
                }
                .padding(.bottom, 10)
            }
            .frame(height: 100)
            
            ScrollView(.vertical) {
                ForEach (step.tasks) { task in
                    HStack {
                        Image(systemName: "poweroff")
                        Text(task.taskName)
                        Spacer()
                    }
                    .padding(.bottom, 10)
                }
            }
        }
    }
    }

//#Preview {
//    TasksView(pebble: )
//}
