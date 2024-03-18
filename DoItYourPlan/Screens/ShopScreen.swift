import SwiftUI

struct ShopScreen: View {
    @State private var selectedHat: Hat?
    @State private var selectedColorFace: ColorFace?
    @Binding var userPoints: Int
    @State private var showAlert = false // Affiche ou non l'alerte
    @State private var selectedSegment = 0
    @State private var hats: [Hat] = []
  
    let segmentImages = ["colorfaceShopScreen", "faceShopScreen", "hairShopScreen","hatShopScreen", "clothesShopScreen", "accessoryShopScreen", "backgroundShopScreen"]
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                Text("Récompenses")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                
                
                ZStack {
                    VStack(spacing: 0) {
                        HStack {
                            Spacer()
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .shadow(color: Color.black, radius: 4, x: 0, y: 2)
                                .frame(width: 100, height: 50)
                                .overlay(
                                    HStack {
                                        Image(systemName: "leaf.fill")
                                            .font(.system(size: 24))
                                            .foregroundColor(Color.black)
                                        Text("\(userPoints)")
                                            .font(.system(size: 24))
                                            .fontWeight(.bold)
                                    }
                                )
                                .padding(.top, 8) // Réduire le padding ici pour remonter le rectangle
                                .padding(.trailing, 16)
                        }
                        .offset(y: -40)
                        
                        
                        Circle()
                            .frame(width: 100, height: 100)
                            .padding(.top, -50)
                        Path { path in
                            path.addArc(center: CGPoint(x: 0, y: 0), radius: 90, startAngle: .degrees(180), endAngle: .degrees(0), clockwise: false)
                            path.addLine(to: CGPoint(x: 0, y: 0))
                            path.closeSubpath()
                        }
                        .frame(width: 100, height: 50)
                        .offset(x: 50, y: 100)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 270)
                    .background(Color("yellowCustom"))
                    
                    if let selectedHat = selectedHat {
                        Image(selectedHat.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 100)
                            .offset(y: -75)
                    }
                }
                
                
                VStack(spacing: 0) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(0..<segmentImages.count, id: \.self) { index in
                                Button(action: {
                                    withAnimation {
                                        selectedSegment = index
                                    }
                                }) {
                                    Image(segmentImages[index])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 50, height: 50)
                                        .padding(8)
                                        .background(index == selectedSegment ? Color.blue : Color.white)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle()
                                                .stroke(index == selectedSegment ? Color.blue : Color.black, lineWidth: 2)
                                        )
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    }
                    
                    
                    if selectedSegment == 0 {
                        /*ColorFaceGridShop(selectedColorFace: $selectedColorFace, userPoints: $userPoints, showAlert: $showAlert)*/
                    } else if selectedSegment == 1 {
                        
                    } else if selectedSegment == 2 {
                        
                    } else if selectedSegment == 3 {
                        HatGridShop(selectedHat: $selectedHat, userPoints: $userPoints, showAlert: $showAlert)
                    } else if selectedSegment == 4 {
                        
                    }  else if selectedSegment == 5 {
                        
                    } else if selectedSegment == 6 {
                        
                    }
                    Spacer()
                    
                }}}
        .alert(isPresented: $showAlert) {
                    Alert(title: Text("Attention"), message: Text("Vous n'avez pas assez de points pour ce chapeau"), dismissButton: .default(Text("OK")))
                }
    }}

#Preview {
  ShopScreen(userPoints: .constant(250))
}
