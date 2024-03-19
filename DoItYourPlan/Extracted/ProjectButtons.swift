//
//  ProjectButtons.swift
//  DoItYourPlan
//
//  Created by apprenant49 on 19/03/2024.
//

import SwiftUI

        struct PressableButtonStyle: ButtonStyle {
            func makeBody(configuration: Self.Configuration) -> some View {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("purple2Custom"))
                        .blur(radius: configuration.isPressed ? 0 : 1)
                        .offset(x: 0, y: configuration.isPressed ? 5 : 10)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(configuration.isPressed ? Color.gray : Color("purpleCustom"))
                       
                        .offset(x: 0, y: configuration.isPressed ? 5 : 0)
                    
                    configuration.label
                        .foregroundColor(.white)
                }
                .animation(.spring(), value: configuration.isPressed)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
                .frame(width: 170, height: 50)
            }
        }

        
        struct ProjectButtons: View {
            var body: some View {
                Button(action: {
                      
                  }) {
                      Text("SUIVRE")
                          .padding() 
                  }
                  .buttonStyle(PressableButtonStyle())
                 
              }
          }

        #Preview{
                ProjectButtons()
            }
        
