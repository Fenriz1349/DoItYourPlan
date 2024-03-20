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

    @State private var myTasks: [Task] = myProject.steps[0].tasks

// TaskName edit
//    @State private var editTaskName: String = ""
//    
//    @State private var isEditing = false

    
    var body: some View {

        ZStack {
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
                                                myTasks.append(Task(taskName: newTaskName, orderNumber: myTasks.count + 1, isDone: false))
                                                if let lastTask = myTasks.last {
                                                    pebbles.insert(lastTask.id.uuidString, at: pebbles.count - 1)
                                                    step.tasks.append(lastTask)
                                                    newTaskName = ""
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
                                            if let taskIndex = myTasks.firstIndex(where: { $0.id == UUID(uuidString: pebble) }) {
                                                let task = myTasks[taskIndex]
                                                task.isDone.toggle()
                                                step.tasks[taskIndex] = task
                                                myTasks[taskIndex] = task
                                            }
                                        }, label: {
                                            if let task = step.tasks.first(where: { $0.id == UUID(uuidString: pebble) }) {
                                                Image(systemName: task.isDone ? "checkmark.circle" : "circle")
                                                    .font(.system(size: 30))
                                                    .foregroundColor(step.stepColor)
                                            }
                                        })
                                        if let task = myTasks.first(where: { $0.id == UUID(uuidString: pebble) }) {
// TaskNameEdit
//                                            TextField(task.taskName, text: $editTaskName, onEditingChanged: { editing in
//                                                self.isEditing = editing
//                                            })
                                            
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
 // Action lorsqu'une tâche est tapée
//                                    .onTapGesture {
//                                    }
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
                        .padding(.bottom, 50)
                        Spacer()
                    }
                }
                )
            }
            .padding(.horizontal, 10)
//            .padding(.top, 10)
        }
        .ignoresSafeArea()
        .onAppear {
            if let stepUUID = UUID(uuidString: pebble),
               let matchingStep = myProject.steps.first(where: { $0.id == stepUUID }) {
                step = matchingStep
                myTasks = matchingStep.tasks
                pebbles = step.tasks.map { $0.id.uuidString } + [addButtonTask]
            }
        }
    }
}


#Preview {
    TasksView(pebble: myProject.steps[5].id.uuidString)
}

