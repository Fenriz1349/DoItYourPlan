//
//  TasksView.swift
//  DoItYourPlan
//
//  Created by Aurélien Chevalier on 14/03/2024.
//
import SwiftUI

struct StepDetail: View {
    
    let pebble: String
    
    @State private var segmentedSelection = 0
    
    @State private var step: Step = myProject.steps[0]

    
    var body: some View {
                
        HStack {
            Text(step.stepName)
                .onAppear {
                    if let stepUUID = UUID(uuidString: pebble),
                       let matchingStep = myProject.steps.first(where: { $0.id == stepUUID }) {
                        step = matchingStep
                    }
                }
         
            ZStack {
                Circle()
                    .fill(step.stepColor)
                Text("Étape \(step.orderNumber)")
                    .foregroundColor(.white)
                if step.isCurrent {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.green)
                        .bold()
                }
            }
        }
        .frame(height: 100)
        .padding(.bottom, 20)
        Spacer()
        
        Picker("", selection: $segmentedSelection) {
            Text("Tâches").tag(0)
            Text("Matériel").tag(1)
        }
        .pickerStyle(.segmented)
        if segmentedSelection == 0 {
            TasksView(pebble: pebble)
        }else {
            MaterialScreen()
        }
    }
}

#Preview {
    StepDetail(pebble: myProject.steps[5].id.uuidString)
}
