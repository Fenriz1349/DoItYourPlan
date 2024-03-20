

import SwiftUI

struct PressableButtonStyless: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        ZStack {
                    Circle()
                        .foregroundColor(Color.blue)
                        .blur(radius: configuration.isPressed ? 0 : 1)
                        .offset(x: 0, y: configuration.isPressed ? 2 : 14)
                    
                    Circle()
                        .fill(configuration.isPressed ? Color.gray : Color.blue)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                        .scaleEffect(configuration.isPressed ? 0.96 : 1.0)
                    
                    configuration.label
                        .foregroundColor(.white)
                }
                .animation(.spring(), value: configuration.isPressed)
                .frame(width: 150, height: 150) // Adjust the frame for a circular button
            }
        }

struct CircleButton: View {
    let iconName: String
    let projectNumber: Int
    let projectTitle: String
    
    var body: some View {
        Button(action: {
                   // Action for the button
        }) {            HStack {
            Image(systemName: iconName)
                .font(.system(size: 24))
            
            
        }.foregroundColor(.black)
        }.buttonStyle(PressableButtonStyless())
        }
       
    }



        #Preview{
            CircleButton(iconName: "arrow.counterclockwise", projectNumber: 3, projectTitle: "Projet en cours")
            }
        
