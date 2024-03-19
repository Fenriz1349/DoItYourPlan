//
//  detailsFinishedProjectsScreen.swift
//  DoItYourPlan
//
//  Created by Amina on 19/03/2024.
//

import SwiftUI

struct detailsFinishedProjectsScreen: View {
    var body: some View {
        VStack{
            Text("Détails Projet")
                .multilineTextAlignment(.center)
                .padding(.horizontal, 142.0)
                .padding(.vertical, 10)
                .border(Color.gray, width: 1)
        }
    }
}

#Preview {
    detailsFinishedProjectsScreen()
}
