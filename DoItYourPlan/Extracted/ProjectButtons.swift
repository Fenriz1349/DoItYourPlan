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
    let iconName: String
    let projectNumber: Int
    let projectTitle: String

    var body: some View {

            HStack {
                Image(systemName: iconName)
                    .font(.system(size: 24))

                VStack(alignment: .leading) {
                    Text("\(projectNumber)")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    Text(projectTitle)
                        .font(.system(size: 16))
                }
            }.foregroundColor(.black).buttonStyle(PressableButtonStyle())
        }

    }
        #Preview{
            ProjectButtons(iconName: "arrow.counterclockwise", projectNumber: 3, projectTitle: "Projet en cours")
            }
