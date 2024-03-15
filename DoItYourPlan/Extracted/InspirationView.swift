//
//  InspirationView.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 14/03/2024.
//

import SwiftUI

struct InspirationView: View {
    @State var showImage : Bool = false
    @State var postIts : [PostIt] = [
        PostIt(name: "Post It 1",x: 350,y: 100, rotation : -5,color: .yellowC, contents: ["test"])
    ]
    @State var imagesInspiration : [ImageInspiration] = [
        ImageInspiration(name: "sample1",x:550,y: 150, link: "Sample1")
    ]
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: 350, height: 50)
                Text("page d'inspiration Projet 1")
            }
            ScrollView{
                ZStack{
                    Image("liegeBackground")
                        .resizable()
                        .frame(width: 900, height: 400)
                        
                        .rotationEffect(Angle(degrees: 90))
                    ForEach($postIts) { postit in
                        ExtPostIt(postit: postit)
                    }
                    ForEach(imagesInspiration.indices, id: \.self) { index in
                        if imagesInspiration[index].isShowed {
                            ExtImageInspiration(img: $imagesInspiration[index])
                                .onTapGesture {
                                    showImage.toggle()
                                }
                        }
                    }
                    if showImage {
                        ExtZoomImage(img: $imagesInspiration[0], showImage: $showImage)
                    }
                }
            }
        }
    }
}

#Preview {
    InspirationView()
}
