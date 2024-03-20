import SwiftUI

struct ShopScreen: View {
    @State private var selectedHat: Hat?
    @State private var selectedColorFace: ColorFace?
    @State private var selectedFace: Face?
    @State private var selectedHair: Hair?
    @State private var selectedAccessory: Accessory?
    @State private var selectedBackground: Background?
    @State private var selectedClothe: Clothe?
    @State private var hats: [Hat] = []
    @State private var faces: [Face] = []
    @State private var hairs: [Hair] = []
    @State private var accessorys: [Accessory] = []
    @State private var colorfaces: [ColorFace] = []
    @State private var backgrounds: [Background] = []
    @State private var clothes: [Clothe] = []
    @ObservedObject var userSelections: UserSelections
    @Binding var userPoints: Int
    @State private var showAlert = false
    @State private var selectedSegment = 0
    
    
    let segmentImages = ["colorfaceShopScreen", "faceShopScreen", "hairShopScreen","hatShopScreen", "clotheShopScreen", "accessoryShopScreen", "backgroundShopScreen"]
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 0) {
                
                ZStack {
                    
                    if let selectedBackground = userSelections.selectedBackground {
                        Color(selectedBackground.color)
                            
                    }
                    
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
                                .padding(.top, 8)
                                .padding(.trailing, 16)
                        }
                        .offset(y: -40)
                       
                        
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.black)
                            .padding(.top, -50)
                        Path { path in
                            path.addArc(center: CGPoint(x: 0, y: 0), radius: 90, startAngle: .degrees(180), endAngle: .degrees(0), clockwise: false)
                            path.addLine(to: CGPoint(x: 0, y: 0))
                            path.closeSubpath()
                        }
                        .frame(width: 100, height: 50)
                        .foregroundColor(Color.black)
                        .offset(x: 50, y: 100)
                    }
                    
                   
                    
                    if let selectedColorFace = userSelections.selectedColorFace {
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor( Color(selectedColorFace.color))
                            .padding(.top, -42)
                    }
                    
                    if let selectedFace = userSelections.selectedFace {
                        Image(selectedFace.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110, height: 70)
                            .offset(y: -17)
                        
                    }
                    if let selectedHair = userSelections.selectedHair {
                        Image(selectedHair.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 130)
                            .offset(y: -50)
                        
                    }
                    if let selectedHat = userSelections.selectedHat {
                        Image(selectedHat.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 100)
                            .offset(y: -75)
                    }
                    if let selectedClothe = userSelections.selectedClothe {
                        Path { path in
                            path.addArc(center: CGPoint(x: 0, y: 0), radius: 90, startAngle: .degrees(180), endAngle: .degrees(0), clockwise: false)
                            path.addLine(to: CGPoint(x: 0, y: 0))
                            path.closeSubpath()
                        }
                        .frame(width: 100, height: 50)
                        .foregroundColor( Color(selectedClothe.color))
                        .offset(x: 50, y:154)
                    }
                    if let selectedAccessory = userSelections.selectedAccessory {
                        Image(selectedAccessory.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 90)
                            .offset(x: -130, y: 85)
                    }
                    
                    
                }
                
                .frame(maxWidth: .infinity)
                .frame(height: 270)
                
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
                        ColorFaceGridShop(selectedColorFace: $selectedColorFace, userPoints: $userPoints, showAlert: $showAlert, userSelections: userSelections)
                    } else if selectedSegment == 1 {
                        FaceGridShop(selectedFace: $selectedFace, userPoints: $userPoints, showAlert: $showAlert, userSelections: userSelections)
                    } else if selectedSegment == 2 {
                        HairGridShop(selectedHair: $selectedHair, userPoints: $userPoints, showAlert: $showAlert, userSelections: userSelections)
                    } else if selectedSegment == 3 {
                        HatGridShop(selectedHat: $selectedHat, userPoints: $userPoints, showAlert: $showAlert, userSelections: userSelections)
                    } else if selectedSegment == 4 {
                        ClotheGridShop(selectedClothe: $selectedClothe, userPoints: $userPoints, showAlert: $showAlert, userSelections: userSelections)
                    }  else if selectedSegment == 5 {
                        AccessoryGridShop(selectedAccessory: $selectedAccessory, userPoints: $userPoints, showAlert: $showAlert, userSelections: userSelections)
                    } else if selectedSegment == 6 {
                        BackgroundGridShop(selectedBackground: $selectedBackground, userPoints: $userPoints, showAlert: $showAlert, userSelections: userSelections)
                    }
                    Spacer()
                    
                }}}.navigationBarTitle("Shop", displayMode: .inline)
        
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Attention"), message: Text("Vous n'avez pas assez de points pour débloquer la customisation, Je vous conseille de continuer les étapes de votre projet pour acquérir des points!"), dismissButton: .default(Text("OK")))
            }
    }
}

#Preview {
    ShopScreen(userSelections: userSelections, userPoints: .constant(250))
}
