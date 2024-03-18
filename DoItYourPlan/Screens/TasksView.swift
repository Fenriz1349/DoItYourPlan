//
//  TasksView.swift
//  DoItYourPlan
//
//  Created by Aurélien Chevalier on 14/03/2024.
//
import SwiftUI

struct TasksView: View {
    let pebble: String
    
    @State private var step: Step = myProject.steps[0]
    
    @State private var pebbles: [String] = []
    
    @State private var draggingItem: String?

// En cours
//    @State private var selectedTaskPosition = CGPoint(x: 0, y: 0)
//    
//    @State private var selectedTaskIndex = 0
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text(step.stepName)
                        .onAppear {
                            if let stepUUID = UUID(uuidString: pebble),
                               let matchingStep = myProject.steps.first(where: { $0.id == stepUUID }) {
                                step = matchingStep
                                pebbles = step.tasks.map { $0.id.uuidString }
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
                            .frame(width: size.width, height: 100)
                            // En cours
//                            .offset(selectedTaskIndex == pebbles.firstIndex(of: pebble) ? CGSize(width: selectedTaskPosition.x, height: selectedTaskPosition.y) : .zero)

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
                                       // Gesture pour le geste de glissement
                                       DragGesture()
                                           .onChanged { gesture in
// En cours
//                                               selectedTaskPosition = gesture.location
                                           }
                                        .onEnded { value in
                                            if value.translation.width < -100 {
                                                if let index = pebbles.firstIndex(of: pebble) {
// En cours
//                                                    selectedTaskIndex = index
                                                    pebbles.remove(at: index)
                                                    step.tasks = pebbles.compactMap { pebbleID in
                                                        step.tasks.first { $0.id.uuidString == pebbleID }
                                                    }
                                                }
                                            } 
// En cours
//                                            else {
//                                                selectedTaskPosition = CGPoint(x: 0, y: 100)
//                                            }
                                        })
                            
                        }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 40)
                    Spacer()
                }
                }
                )
            }
            .padding(.horizontal, 10)
            .padding(.top, 210)
        }
        .ignoresSafeArea()
    }
}



