import SwiftUI

struct ShopScreen: View {
    @State private var selectedSegment = 0
    let segmentImages = ["colorfaceShopScreen", "faceShopScreen", "hairShopScreen","hatShopScreen", "clothesShopScreen", "accessoryShopScreen", "backgroundShopScreen"]
    
    var body: some View {
        
        VStack {
            Text("Récompenses")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(.black)
            NavigationView {
                ScrollView{
                    ZStack{
                        VStack {
                            
                            HStack{
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
                                            
                                            
                                            Text("100")
                                                .font(.system(size: 24))
                                            .fontWeight(.bold)})}.padding(.top, 14.0)
                                .padding(.trailing, 10)
                            
                            VStack(spacing: -3) {
                                Circle()
                                    .frame(width: 100, height: 100)
                                
                                Path { path in
                                    path.addArc(center: CGPoint(x: 0, y: 0), radius: 90, startAngle: .degrees(180), endAngle: .degrees(0), clockwise: false)
                                    path.addLine(to: CGPoint(x: 0, y: 0))
                                    path.closeSubpath()
                                }
                                .frame(width: 100, height: 50)
                                .offset(x: 50, y: 100)
                                Spacer()
                            }}
                        .frame(maxWidth: .infinity)
                        .frame(height: 270).background(Color("yellowCustom"))
                        
                        
                    }
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(0..<segmentImages.count, id: \.self) { index in
                                    Button(action: {
                                        selectedSegment = index
                                    }, label: {
                                        Image(segmentImages[index])
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                        
                                            .padding(8)
                                            .background(index == selectedSegment ? Color.blue : Color.white)
                                            .clipShape(Circle())
                                            .overlay(
                                                Circle()
                                                    .stroke(index == selectedSegment ? Color.blue : Color.black, lineWidth: 2)                                          )
                                        
                                        
                                    })
                                    
                                }
                            }
                            .padding()
                            Divider()  
                        }
                        
                        if selectedSegment == 0 {
                       
                        } else if selectedSegment == 1 {
                            
                        } else if selectedSegment == 2 {
                            
                        } else if selectedSegment == 3 {
                            HatGridShop()
                        } else if selectedSegment == 4 {
                            
                        }  else if selectedSegment == 5 {
                            
                        } else if selectedSegment == 6 {
                            
                        }
                        Spacer()
                            
                        }}}}
    }}

#Preview {
    ShopScreen()
}
