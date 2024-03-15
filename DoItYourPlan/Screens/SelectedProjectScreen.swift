//
//  DoItYourPlan
//
//  Created by aurelien on 12/03/24.
//

import SwiftUI

struct SelectedProjectScreen: View {
    
    @State private var pebbles: [String] = myProject.steps.map { step in
        return step.id.uuidString
    }
    @State private var draggingItem: String?
    @State private var zoom: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                ForEach(pebbles, id: \.self) { pebble in
                    Text(pebble)
                }
                LazyVGrid(columns: [GridItem()], content: {
                    ForEach(pebbles, id: \.self) { pebble in
                        
                        GeometryReader {
                            let size = $0.size
                            NavigationLink(destination: TasksView()) {
                                HStack {
                                    if let step = myProject.steps.first(where: { $0.id.uuidString == pebble }) {
                                        Text(step.stepName)
                                    }
                                    ZStack {
                                        Circle()
                                        if let step = myProject.steps.first(where: { $0.id.uuidString == pebble }) {
                                            Circle()
                                                .fill(step.stepColor.gradient)
                                        }
                                        if let step = myProject.steps.first(where: { $0.id.uuidString == pebble }) {
                                            Text("Etape \(step.orderNumber)")
                                                .foregroundColor(.white)
                                        }
                                    }
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
                                .position(x: size.width - 0.5 * size.width * Double.random(in: 0.4...1.0), y: size.height / 2)
                            }}
                        .frame(height: zoom ? 180 : 100)
                    }
                })
                .padding(15)
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
