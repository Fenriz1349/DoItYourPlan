//
//  TasksView.swift
//  DoItYourPlan
//
//  Created by Aurélien Chevalier on 14/03/2024.
//
import SwiftUI

let addButtonTask = UUID().uuidString

struct TasksView: View {
    let pebble: String
    
    @State private var step: Step = myProject.steps[0]
    
    @State private var pebbles: [String] = []
    
    @State private var draggingItem: String?
    
    @State private var selectedTaskxOffset: CGFloat = 0
    
    @State private var selectedTaskId = ""
    
    @State private var newTaskName: String = ""
    
    @State private var newStepName: String = ""

    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    if step.stepName == "Nouvelle étape" {
                        TextField("Nouvelle étape", text: $newStepName)
                            .frame(width: 150)
                            .onSubmit {
                                if !newStepName.isEmpty {
                                    if let stepUUID = UUID(uuidString: pebble) {
// Renommer le step
//                                        myProject.addTask(toStep: stepUUID, taskName: newTaskName, isDone: false)
                                    }
                                }
                            }
                    }
                                  else {
                            
                            Text(step.stepName)
                                .onAppear {
                                    if let stepUUID = UUID(uuidString: pebble),
                                       let matchingStep = myProject.steps.first(where: { $0.id == stepUUID }) {
                                        step = matchingStep
                                        pebbles = step.tasks.map { $0.id.uuidString } + [addButtonTask]
                                    }
                                }
                        }
                    
                    ZStack {
                        Circle()
                            .fill(step.stepColor)
                        Text("Étape \(step.orderNumber)")
                            .foregroundColor(.white)
                    }
                }
                .frame(height: 100)
                Spacer()
            }
            .padding(.top, 90)
            
            ScrollView(.vertical) {
                LazyVGrid(columns: [GridItem()], content: {
                    ForEach(pebbles, id: \.self) { pebble in
                        GeometryReader {
                            let size = $0.size

                            if pebble == addButtonTask {
                                HStack {
                                    Image(systemName: "plus.circle")
                                        .font(.system(size: 30))
                                        .foregroundColor(step.stepColor)
                                        TextField("Ajouter une tâche", text: $newTaskName)
                                        .onSubmit {
                                            if !newTaskName.isEmpty {
                                                if let stepUUID = UUID(uuidString: pebble) {
                                                    myProject.addTask(toStep: stepUUID, taskName: newTaskName, isDone: false)
                                                }
                                            }
                                        }
                                    Spacer()
                                }
                                .background(.white)
                                .frame(width: size.width, height: 100)
                            }
                            else {
                                ZStack {
                                    HStack {
                                        Spacer()
                                        Text("Supprimer ")
                                    }
                                    .foregroundColor(.red)
                                    .fontWeight(.bold)
                                    
                                    HStack {
                                        Button(action: {
                                            if let taskIndex = step.tasks.firstIndex(where: { $0.id == UUID(uuidString: pebble) }) {
                                                let task = step.tasks[taskIndex]
                                                task.isDone.toggle()
                                                step.tasks[taskIndex] = task
                                            }
                                        }, label: {
                                            if let task = step.tasks.first(where: { $0.id == UUID(uuidString: pebble) }) {
                                                Image(systemName: task.isDone ? "checkmark.circle" : "circle")
                                                    .font(.system(size: 30))
                                                    .foregroundColor(step.stepColor)
                                            }
                                        })
                                        if let task = step.tasks.first(where: { $0.id == UUID(uuidString: pebble) }) {
                                            Text(task.taskName)
                                        }
                                        Spacer()
                                    }
                                    .background(.white)
                                    .frame(width: size.width, height: 100)
                                    .offset(x: selectedTaskId == pebble ? selectedTaskxOffset : 0, y: 0)
                                    .draggable(pebble) {
                                        Circle()
                                            .opacity(0.0)
                                            .onAppear {
                                                draggingItem = pebble
                                            }
                                    }
                                    .dropDestination(for: String.self) { items, location in
                                        draggingItem = nil
                                        return false
                                    } isTargeted: { status in
                                        if let draggingItem = draggingItem, status {
                                            if let sourceIndex = pebbles.firstIndex(of: draggingItem),
                                               let destinationIndex = pebbles.firstIndex(of: pebble) {
                                                withAnimation(.bouncy) {
                                                    let sourceItem = pebbles.remove(at: sourceIndex)
                                                    pebbles.insert(sourceItem, at: destinationIndex)
                                                    step.tasks = pebbles.compactMap { pebbleID in
                                                        step.tasks.first { $0.id.uuidString == pebbleID }
                                                    }
                                                    step.updateTaskOrder()
                                                }
                                            }
                                        }
                                    }
                                    .onTapGesture {
                                        // Action lorsqu'une tâche est tapée
                                    }
                                    .gesture(
                                        DragGesture()
                                            .onChanged { gesture in
                                                self.selectedTaskxOffset = gesture.translation.width
                                                selectedTaskId = pebble
                                            }
                                            .onEnded { value in
                                                if value.translation.width < -200 {
                                                    if let index = pebbles.firstIndex(of: pebble) {
                                                        pebbles.remove(at: index)
                                                        step.tasks = pebbles.compactMap { pebbleID in
                                                            step.tasks.first { $0.id.uuidString == pebbleID }
                                                        }
                                                    }
                                                }
                                                else {
                                                    self.selectedTaskxOffset = 0
                                                }
                                            })
                                    
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 40)
                        Spacer()
                    }
                }
                
                    
                
                )
            }
            .padding(.horizontal, 10)
            .padding(.top, 190)
        }
        .ignoresSafeArea()
    }
}
