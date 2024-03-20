//
//  ExtZoomImage.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 15/03/2024.
//

import SwiftUI

struct ExtZoomImage: View {
    @StateObject var img : ImageInspiration
    @Binding var showImage : Bool
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.5))
                .frame(width: 375,height: 450)
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
                        HStack{
                            Image(systemName: "trash.fill")
                                .bold()
                        }
                    }
                    .buttonStyle(PressableButtonStylesIcone(width: 45, color: .red))
                }
                .font(.system(size: 24))
                .foregroundStyle(.red)
                Spacer()
                Button {
                    showImage.toggle()
                } label: {
                    Image(systemName: "multiply.circle")
                        .font(.system(size: 24))
                }
                .buttonStyle(PressableButtonStylesIcone(width: 45, color: .blue))
            }
        }
        .frame(width: 350,height: 375)
    }
}

#Preview {
    ExtZoomImage(img: ImageInspiration(name: "sample1",x:175,y: 175, link: "Sample1"),showImage: .constant(true))
}
