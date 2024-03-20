//
//  TasksView.swift
//  DoItYourPlan
//
//  Created by Aurélien Chevalier on 14/03/2024.
//

import SwiftUI

let addButtonTask2 = UUID().uuidString

struct TasksView2: View {
    
    let pebble: String
    
    @State private var step: Step = myProject2.steps[0]
    
    @State private var pebbles: [String] = []
    
    @State private var draggingItem: String?
    
    @State private var selectedTaskxOffset: CGFloat = 0
    
    @State private var selectedTaskId = ""
    
    @State private var newTaskName: String = ""
    
    @State private var newStepName: String = ""
    
    @State private var myTasks: [Task] = myProject2.steps[0].tasks
    
    @State private var isCongratulationTaskViewVisible = false
    
    @State private var isCongratulationProjectViewVisible = false

    
    var body: some View {
        
        ZStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: [GridItem()], content: {
                    ForEach(pebbles, id: \.self) { pebble in
                        GeometryReader {
                            let size = $0.size
                            // Pebble task adding
                            if pebble == addButtonTask2 {
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
                                // Pebble task
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
                                                                                                
                                                    if let maxStepOrderNumber = myProject2.steps.max(by: { $0.orderNumber < $1.orderNumber }) {
                                                        if myTasks.allSatisfy({ $0.isDone }) && !(step.orderNumber == maxStepOrderNumber.orderNumber) {
                                                            isCongratulationTaskViewVisible = true
                                                            Timer.scheduledTimer(withTimeInterval: 7, repeats: false) { _ in
                                                                isCongratulationTaskViewVisible = false
                                                            }
                                                        }
                                                    }
                                                
                                                if let maxStepOrderNumber = myProject2.steps.max(by: { $0.orderNumber < $1.orderNumber }) {
                                                    if myTasks.allSatisfy({ $0.isDone }) && (step.orderNumber == maxStepOrderNumber.orderNumber) {
                                                        isCongratulationProjectViewVisible = true
                                                        Timer.scheduledTimer(withTimeInterval: 7, repeats: false) { _ in
                                                            isCongratulationProjectViewVisible = false
                                                        }
                                                    }
                                                }
                                                
                                            }
                                        }, label: {
                                            if let task = step.tasks.first(where: { $0.id == UUID(uuidString: pebble) }) {
                                                Image(systemName: task.isDone ? "checkmark.circle" : "circle")
                                                    .font(.system(size: 30))
                                                    .foregroundColor(step.stepColor)
                                            }
                                        })
                                        if let task = myTasks.first(where: { $0.id == UUID(uuidString: pebble) }) {
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
        }
        .ignoresSafeArea()
        .onAppear {
            if let stepUUID = UUID(uuidString: pebble),
               let matchingStep = myProject2.steps.first(where: { $0.id == stepUUID }) {
                step = matchingStep
                myTasks = matchingStep.tasks
                pebbles = step.tasks.map { $0.id.uuidString } + [addButtonTask2]
            }
        }
        .sheet(isPresented: $isCongratulationTaskViewVisible) {
            CongratulationsTaskScreen()
                }
        .sheet(isPresented: $isCongratulationProjectViewVisible) {
            CongratulationsProjectScreen()
                }
    }
}


#Preview {
    TasksView(pebble: myProject2.steps[5].id.uuidString)
}
