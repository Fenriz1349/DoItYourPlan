//
//  ExtZoomImage.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 15/03/2024.
//

import SwiftUI

struct ExtZoomImage: View {
    @Binding var img : ImageInspiration
    @Binding var showImage : Bool
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color("blackCustom").opacity(0.8), Color.gray.opacity(0.5)]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                .frame(width: 375,height: 450)
            Image(img.link)
                .resizable()
                .frame(width: 350,height: 350)

            VStack{
                HStack{
                    Spacer()
                    Button {
                        img.isShowed.toggle()
                        showImage.toggle()
                    } label: {
                        Image(systemName: "clear.fill")
                        Text("Supprimer")
                            .bold()
                    }
                    .padding(.trailing,20)
                }
                .font(.system(size: 24))
                .foregroundStyle(.red)
                Spacer()
                Button {
                    showImage.toggle()
                } label: {
                    Text("retour")
                        .font(.system(size: 24))
                }
            }
        }
        .frame(width: 350,height: 375)
//        .background(.red)
    }
}

#Preview {
    ExtZoomImage(img: .constant(ImageInspiration(name: "sample1",x:175,y: 175, link: "Sample1")),showImage: .constant(true))
}
