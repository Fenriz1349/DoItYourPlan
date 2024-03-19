//
//  AccessoryGridShop.swift
//  DoItYourPlan
//
//  Created by apprenant49 on 15/03/2024.

import SwiftUI

struct AccessoryGridShop: View {
    @Binding var selectedAccessory: Accessory?
    @Binding var userPoints: Int
    @Binding var showAlert: Bool
    @ObservedObject var userSelections: UserSelections

    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .fill(Color.black)
            .frame(height: 1)
        ScrollView {
            Text("Accessoires")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .padding(.bottom, 20)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 20) {
                ForEach(accessories) { accessory in
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .stroke(Color.black, lineWidth: 1)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            
                            if accessory.iconCadenas {
                                HStack {
                                    Spacer()
                                    Image(systemName: "lock.fill")                                        .foregroundColor(.black)
                                        .padding(.top, -37)
                                        .padding(.leading, -25)
                                }
                            } else {
                                Color.clear
                            }
                        }
                        .frame(width: 90, height: 90)
                        .overlay(
                            Image(accessory.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        )
                        if accessory.iconCadenas, let points = accessory.points {
                            HStack {
                                Image(systemName: "leaf.fill")
                                    .foregroundColor(.black)
                                Text("\(points.nbrPoints)")
                                    .foregroundColor(.black)
                            }
                        } else {
                            Color.clear
                        }
                    }.onTapGesture {
                        if accessory.iconCadenas {
                            if userPoints >= accessory.points?.nbrPoints ?? 0 {
                                userPoints -= accessory.points?.nbrPoints ?? 0
                                if let index = accessories.firstIndex(where: { $0.id == accessory.id }) {
                                    accessories[index].iconCadenas = false
                                    userSelections.selectedAccessory = accessories[index]
                                }
                            } else {
                                showAlert = true
                            }
                        } else {
                            userSelections.selectedAccessory = accessory

                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AccessoryGridShop(selectedAccessory: .constant(nil), userPoints: .constant(100), showAlert: .constant(false), userSelections: userSelections)
       
    }
