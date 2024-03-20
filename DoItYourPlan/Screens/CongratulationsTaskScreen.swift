//
//  CongratulationsTaskScreen.swift
//  DoItYourPlan
//
//  Created by apprenant49 on 19/03/2024.
//

import SwiftUI
import Confetti

struct CongratulationsTaskScreen: View {
    
    @State private var isConfettiActive = false
    @State private var isZooming = false
    @State private var rotationAngle = 0.0
   
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                
                Text("Félicitations !")
                    .font(.system(size: 24, weight: .bold))
                
                Text("Félicitations vous venez de gagner 50 points pour la validation de votre étape. ")
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                
                Circle()
                    .fill(Color.white)
                    .shadow(color:.yellow, radius: 4, x: 0, y: 2)
                    .frame(width: isZooming ? 300 : 150, height: isZooming ? 300 : 150)
                    .overlay(
                        VStack{
                            Image(systemName: "leaf.fill")
                            Text("50")
                            Text("points")
                           
                            
                        }
                            .font(.system(size: isZooming ? 66 : 22, weight: .bold))
                            .foregroundColor(Color.yellow)
                    )
                
                    .rotationEffect(.degrees(rotationAngle))
                    .onAppear() {
                        withAnimation(Animation.easeInOut(duration: 1.5)) {
                            isZooming.toggle()
                        }
                        withAnimation(Animation.linear(duration: 1.5)) {
                            rotationAngle = 360
                        }
                    }
                VStack{
                    Text("Continuez à avancer !")
                    Text("Rome ne s'est pas faite en un jour")
                }
                    .multilineTextAlignment(.center)
                    .padding(.top, 30)
                
                Spacer()
            }
            
            if isConfettiActive {
                ConfettiView()
            }
        }
        
        .onAppear {
            self.isConfettiActive = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 5)
            {
                self.isConfettiActive = false
            }
        }
    }
}
#Preview {
    CongratulationsTaskScreen()
}
