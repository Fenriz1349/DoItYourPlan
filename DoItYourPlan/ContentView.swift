//
//  ContentView.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var userPoints = 250
    @StateObject var userSelections = UserSelections()
    var body: some View {
        TabView {
            ProjectsScreen()
                .tabItem {
                    Image(systemName: "square.on.square")
                    Text("Projets")
                }
            LibraryScreen()
                .tabItem {
                    Image(systemName: "books.vertical")
                    Text("Bibliothèque")
                }
            SelectedProjectScreen()
                .tabItem {
                    Image(systemName: "arrow.counterclockwise")
                    Text("En Cours")
                }
            PlanningScreen()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendrier")
                }
            ProfilScreen(userPoints: $userPoints, userSelections: userSelections)
                .tabItem {
                    Image(systemName: "person")
                    Text("Profil")
                }
        }
    }
}

#Preview {
    ContentView()
}
