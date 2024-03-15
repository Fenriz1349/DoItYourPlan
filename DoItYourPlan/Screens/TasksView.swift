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
                ForEach(step.tasks, id: \.id) { task in
                    HStack {
                        Button(action: {
                            if let step = myProject.steps.first(where: { $0.id.uuidString == pebble }) {
                                step.toggleTaskStatus(taskID: task.id)
                            }
                        }, label: {
                            Image(systemName: task.isDone ? "checkmark.circle" : "circle")
                                .font(.system(size: 30))
                                .foregroundColor(step.stepColor)
                        })
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
