//
//  DoItYourPlan
//
//  Created by aurelien on 12/03/24.
//

import SwiftUI

class Project: Identifiable, ObservableObject {
    @Published var id = UUID()
    @Published var projectName: String
    
    init(id: UUID = UUID(), projectName: String) {
        self.id = id
        self.projectName = projectName
    }
}

class Step: Project {
    @Published var stepName: String
    @Published var orderNumber: Int
    @Published var isDone: Bool
    
    init(stepName: String, orderNumber: Int, isDone: Bool, id: UUID = UUID(), projectName: String) {
            self.stepName = stepName
            self.orderNumber = orderNumber
            self.isDone = isDone
            super.init(id: id, projectName: projectName)
    }
}


struct SelectedProjectScreen: View {
    @State private var colors: [Color] = [.red, .blue, .purple, .yellow, .black, .indigo, .cyan, .brown, .mint, .orange]
    @State private var draggingItem: Color?
    @State private var zoom: Bool = false
    
    var steps: [Step] = [
        Step(stepName: "Choix du patron", orderNumber: 1, isDone: true, projectName: "Projet Couture")]
        
    var i: Int = 0
    //   "Choix du patron", "Sélection tissu", "Mesures", "Découpe", "Assemblage", "Ourlets", "Ajustements", "Repassage", "Finitions"]

        
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: [GridItem()], content: {
                    ForEach(colors, id: \.self) { color in
                        GeometryReader {
                            let size = $0.size
                            NavigationLink(destination: TasksView()) {
                            HStack {
                                Text("Description")
                                ZStack {
                                    Circle()
                                        .fill(color.gradient)
                                    /// Drag
                                    Text("Etape\r\(color)")
                                        .foregroundColor(.white)
                                        .draggable(color) {
                                            /// Custom Preview View
                                            Circle()
                                                .opacity(0.0)
                                                .onAppear {
                                                    draggingItem = color
                                                }
                                        }
                                    /// Drop
                                        .dropDestination(for: Color.self) { items, location in
                                            draggingItem = nil
                                            return false
                                        } isTargeted: { status in
                                            if let draggingItem, status, draggingItem != color {
                                                /// Moving Color from source to destination
                                                if let sourceIndex = colors.firstIndex(of: draggingItem),
                                                   let destinationIndex = colors.firstIndex(of: color) {
                                                    withAnimation(.bouncy) {
                                                        let sourceItem = colors.remove(at: sourceIndex)
                                                        colors.insert(sourceItem, at: destinationIndex)
                                                    }
                                                }
                                            }
                                        }
                                }}
                            .position(x: size.width - 0.5 * size.width * Double.random(in: 0.4...1.0), y: size.height / 2)
                            
                        }}
                        .frame(height: zoom ? 180 : 100)
                    }
                })
                .padding(15)
            }
            .navigationTitle("Projet couture")
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
