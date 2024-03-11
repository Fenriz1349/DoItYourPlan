//
//  ContentView.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct ContentView: View {
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
            PlanningScreen()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendrier")
                }
            ProfilScreen()
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
