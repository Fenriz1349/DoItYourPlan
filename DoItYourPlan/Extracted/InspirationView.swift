//
//  InspirationView.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 14/03/2024.
//

import SwiftUI

struct InspirationView: View {
    @State var showImage: Bool = false
    @State var showPostIt: Bool = false
    @State var postItIndex: Int = 0
    @State var imageIndex: Int = 0
    @State private var selectedPostItIndex: Int? = nil
    @State private var selectedImageIndex: Int? = nil
    @State var postIts: [PostIt] = [
        PostIt(name: "Post It 1", x: 350, y: 100, rotation: -5, color: .yellowC, contents: ["test", "test2"]),
        PostIt(name: "Post It 2", x: 350, y: 300, rotation: 10, color: .blueC, contents: ["test", "test2"])
    ]
    @State var imagesInspiration: [ImageInspiration] = [
        ImageInspiration(name: "sample1", x: 550, y: 150, link: "Sample1"),
        ImageInspiration(name: "sample2", x: 560, y: 200, link: "Sample2"),
        ImageInspiration(name: "sample2", x: 570, y: 250, link: "Sample3")
    ]
    
    @State var postItDragOffset: CGSize = .zero
    @State var imageDragOffset: CGSize = .zero
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: 350, height: 50)
                Text("page d'inspiration Projet 1")
            }
            ScrollView {
                ZStack {
                    Image("liegeBackground")
                        .resizable()
                        .frame(width: 900, height: 400)
                        .rotationEffect(Angle(degrees: 90))
                    
                    ForEach(postIts.indices, id: \.self) { index in
                        if postIts[index].isShowed {
                            ExtPostIt(width: 150, postit: $postIts[index])
                                .position(x: postIts[index].x, y: postIts[index].y)
                                .onTapGesture {
                                    postItIndex = index
                                    showPostIt.toggle()
                                }
                                .gesture(
                                    LongPressGesture(minimumDuration: 1.0)
                                        .onEnded { _ in
                                            selectedPostItIndex = index
                                        }
                                )
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            postItDragOffset = value.translation
                                        }
                                        .onEnded { value in
                                            postIts[index].x += value.translation.width
                                            postIts[index].y += value.translation.height
                                            postItDragOffset = .zero
                                            selectedPostItIndex = nil
                                        }
                                )
                        }
                    }
                    
                    ForEach(imagesInspiration.indices, id: \.self) { index in
                        if imagesInspiration[index].isShowed {
                            ExtImageInspiration(img: $imagesInspiration[index])
                                .offset(index == selectedImageIndex ? imageDragOffset : .zero)
                                .gesture(
                                    LongPressGesture(minimumDuration: 1.0)
                                        .onEnded { _ in
                                            selectedImageIndex = index
                                        }
                                )
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            imageDragOffset = value.translation
                                        }
                                        .onEnded { value in
                                            imagesInspiration[index].x += value.translation.width
                                            imagesInspiration[index].y += value.translation.height
                                            
                                            imageDragOffset = .zero
                                            selectedImageIndex = nil
                                        }
                                )
                        }
                    }
                    
                    if showImage {
                        ExtZoomImage(img: imagesInspiration[imageIndex], showImage: $showImage)
                            .position(x: 450, y: 250)
                    }
                    if showPostIt {
                        ExtZoomPostIt(postit: postIts[postItIndex], showPostIt: $showPostIt)
                            .position(x: 450, y: 250)
                    }
                }
            }
        }
    }
}
#Preview {
    InspirationView()
}
