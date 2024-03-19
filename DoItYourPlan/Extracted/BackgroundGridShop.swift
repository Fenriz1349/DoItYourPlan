//
//  BackgroundGridShop.swift
//  DoItYourPlan
//
//  Created by apprenant49 on 15/03/2024.
//
import SwiftUI

struct BackgroundGridShop: View {
    @Binding var selectedBackground: Background?
    @Binding var userPoints: Int
    @Binding var showAlert: Bool
    @ObservedObject var userSelections: UserSelections
    
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .fill(Color.black)
            .frame(height: 1)
        ScrollView {
            Text("Arrière-plans")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .padding(.bottom, 20)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 20) {
                ForEach(backgrounds) { background in
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(background.color) // Utilisez la couleur de l'arrière-plan
                                .frame(width: 90, height: 90)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black, lineWidth: 1)
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                )
                            VStack {
                                if background.iconCadenas {
                                    Image(systemName: "lock.fill")
                                        .foregroundColor(.black)
                                        .padding(.top, 15)
                                        .padding(.leading, 40)
                                } else {
                                    Color.clear
                                        .frame(width: 24, height: 24)
                                        .padding(.top, -37)
                                        .padding(.trailing, 40)
                                }
                                Spacer()
                            }
                        }
                        if let points = background.points {
                            HStack {
                                Image(systemName: "leaf.fill")
                                    .foregroundColor(.black)
                                Text("\(points.nbrPoints)")
                                    .foregroundColor(.black)
                            }
                        } else {
                            HStack {
                                Spacer()
                                Text(" ")
                                    .foregroundColor(.clear)
                            }
                        }
                    }
                    .onTapGesture {
                        if background.iconCadenas {
                            if userPoints >= background.points?.nbrPoints ?? 0 {
                                userPoints -= background.points?.nbrPoints ?? 0
                                userSelections.selectedBackground = background
                            } else {
                                showAlert = true
                            }
                        } else {
                            userSelections.selectedBackground = background
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    BackgroundGridShop(selectedBackground: .constant(nil), userPoints: .constant(100), showAlert: .constant(false), userSelections: userSelections)
}
