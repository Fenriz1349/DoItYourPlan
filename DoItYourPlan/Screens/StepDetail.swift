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
    
    @State private var newStepName: String = ""
    
    var body: some View {
        
        // Step name
        HStack {
            if step.stepName == "Nouvelle étape" {
                HStack {
                    TextField("Nouvelle étape", text: $newStepName)
                        .onSubmit {
                            step.stepName = newStepName
                        }
                }
                .padding(.horizontal, 10)
            } else {
                
                Text(step.stepName)
                    .onAppear {
                        // step init with UUID in pebble
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
                }
            }
        }
        .frame(height: 100)
        .padding(.bottom, 20)
        Spacer()
        
        // Segmented section
        Picker("", selection: $segmentedSelection) {
            Text("Tâches").tag(0)
            Text("Matériel").tag(1)
        }
        .pickerStyle(.segmented)
        if segmentedSelection == 0 {
            TasksView(pebble: pebble)
        } else {
            MaterialScreen(stepColor: step.stepColor)
        }
    }
}

#Preview {
    StepDetail(pebble: myProject.steps[5].id.uuidString)
}
