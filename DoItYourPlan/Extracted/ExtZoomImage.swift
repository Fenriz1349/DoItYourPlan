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
            Image(img.link)
                .resizable()
                .frame(width: 350,height: 350)
                .position(x: 175, y: 175)
            VStack{
                HStack{
                    Spacer()
                    Button {
                        img.isShowed.toggle()
                        showImage.toggle()
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                        Text("Supprimer")
                            .bold()
                    }
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
    ExtZoomImage(img: .constant(ImageInspiration(name: "sample1",x:550,y: 150, link: "Sample1")),showImage: .constant(true))
}
