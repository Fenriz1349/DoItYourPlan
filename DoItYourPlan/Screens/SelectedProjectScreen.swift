//
//  DoItYourPlan
//
//  Created by Aurélien Chevalier on 12/03/24.
//

import SwiftUI

let addButtonStep = UUID().uuidString

struct SelectedProjectScreen: View {
    @State private var pebbles: [String] = myProject.steps.map { step in
        return step.id.uuidString
    } + [addButtonStep]
    @State private var draggingItem: String?
    @State private var zoom: Bool = false
    @State private var isFirstUnfinishedStepFound: Bool = false
    
    @State private var mySteps: [Step] = myProject.steps
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: [GridItem()], content: {
                    ForEach(pebbles, id: \.self) { pebble in
                        
                        GeometryReader {
                            let size = $0.size
                            // Pebble new step
                            if pebble == addButtonStep {
                                Button(action: {
                                    myProject.addStep(stepName: "Nouvelle étape", orderNumber: myProject.steps.count + 1, isDone: false, isCurrent: false, stepColor: randomColor(), stepPosition: randomStepPosition())
                                    pebbles = myProject.steps.map { step in
                                        return step.id.uuidString
                                    } + [addButtonStep]
                                }) {
                                    HStack(alignment: .center) {
                                        if let step = myProject.steps.first(where: { $0.id.uuidString == pebble }) {
                                            Text(step.stepName)
                                                .foregroundColor(.black)
                                        }
                                        ZStack {
                                            Circle()
                                            if let step = myProject.steps.first(where: { $0.id.uuidString == pebble }) {
                                                Circle()
                                                    .fill(step.stepColor.gradient)
                                            }
                                            Text("Ajouter\rune étape")
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                }
                            } else {
                                // Pebble each step
                                NavigationLink(destination: StepDetail(pebble: pebble)) {
                                    HStack(alignment: .center) {
                                        if let step = myProject.steps.first(where: { $0.id.uuidString == pebble }) {
                                            Text(step.stepName)
                                                .foregroundColor(.black)
                                        }
                                        ZStack {
                                            if let step = myProject.steps.first(where: { $0.id.uuidString == pebble }) {
                                                if step.isDone {
                                                    Circle()
                                                        .fill(.gray.opacity(0.5).gradient)
                                                } else {
                                                    Circle()
                                                        .fill(step.stepColor.gradient)
                                                }
                                            }
                                            if let step = myProject.steps.first(where: { $0.id.uuidString == pebble }) {
                                                Text("Etape \(step.orderNumber)")
                                                    .foregroundColor(.white)
                                                if step.isCurrent {
                                                    Image(systemName: "avatar")
                                                        .resizable()
                                                        .frame(width: 50, height: 50)
                                                        .foregroundColor(Color.green)
                                                        .bold()
                                                }
                                            }
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                }
                                .position(x: size.width - 0.5 * size.width, y: size.height / 2)
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
                                                myProject.steps = pebbles.compactMap { pebbleID in
                                                    myProject.steps.first { $0.id.uuidString == pebbleID }
                                                }
                                                myProject.updateOrder()
                                            }
                                        }
                                    }
                                    
                                }
                            }
                        }
                        .frame(height: zoom ? 180 : 100)
                    }
                })
            }
            .navigationTitle(myProject.projectName)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation(.bouncy) {
                            zoom.toggle()
                        }
                    } label: {
                        Image(systemName: zoom ? "circle.grid.2x2" : "circle.grid.2x1")
                            .font(.title3)
                    }
                }
            })
        }
    }
}

#Preview {
    SelectedProjectScreen()
}
