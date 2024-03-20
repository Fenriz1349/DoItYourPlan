//
//  CongratulationsProjectScreen.swift
//  DoItYourPlan
//
//  Created by apprenant49 on 19/03/2024.
//

import SwiftUI
import Confetti

struct CongratulationsProjectScreen: View {
    
    @State private var isConfettiActive = false
    @State private var isAnimating = false
   
    var body: some View {
       
            ZStack {
                VStack(spacing: 20) {
                    Spacer()
                    
                    Text("Félicitations !")
                        .font(.system(size: 24, weight: .bold))
                    
                    Text("Félicitations pour l'achèvement de votre premier projet. Vous avez été récompensé de la médaille")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(color: Color.yellow, radius: 4, x: 0, y: 2)
                        .frame(width: 150, height: 150)
                        .overlay(
                            Image(systemName: "medal.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.yellow)
                                .scaleEffect(isAnimating ? 1.5 : 1.0)
                                .onAppear() {
                                    withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                                        isAnimating = true
                                    }
                                }
                        )
                    Text("Volonté de Fer")
                        .font(.system(size: 24, weight: .bold))
                        .padding(.top)
                    
                    Text("Continuez à avancer ! Vous faites de grands progrès.")
                    
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    Spacer()
                }
                    
                
                
                
                if isConfettiActive {
                    ConfettiView()
                }
            }
        
            .onAppear {
                self.isConfettiActive = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.isConfettiActive = false
                }
            }
        }
    }


#Preview {
    CongratulationsProjectScreen()
}
