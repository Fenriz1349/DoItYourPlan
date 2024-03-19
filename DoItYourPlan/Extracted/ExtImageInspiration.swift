//
//  ExtImageInspiration.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 15/03/2024.
//

import SwiftUI

struct ExtImageInspiration: View {
    @Binding var img : ImageInspiration
    var body: some View {
        Image(img.link)
            .resizable()
            .frame(width: img.width,height: img.heigth)
            .position(x: img.x, y: img.y)
            .rotationEffect(Angle(degrees: img.rotation))
    }
}

#Preview {
    ExtImageInspiration(img: .constant(ImageInspiration(name: "sample1",x:550,y: 150, link: "Sample1")))
}
