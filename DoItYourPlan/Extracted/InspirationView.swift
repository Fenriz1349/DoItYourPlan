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
    @State var showNewPostIt : Bool = false
    @State var postItIndex: Int = 0
    @State var imageIndex: Int = 0
    @State private var selectedPostItIndex: Int? = nil
    @State private var selectedImageIndex: Int? = nil
    @StateObject var listePostIt  = PostItList()
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
            HStack{
                Button {
                    showNewPostIt.toggle()
                } label: {
                    HStack{
                        Image(systemName: "plus.app.fill")
                        Text("Ajouter PostIt")
                            .font(.system(size: 18))
                    }
                }.padding(.leading,10)
                Spacer()
                Button {
                    showNewPostIt.toggle()
                } label: {
                    HStack{
                        Image(systemName: "plus.app.fill")
                        Text("Ajouter Image")
                            .font(.system(size: 18))
                    }
                }.padding(.trailing,10)
            }
            ScrollView {
                ZStack {
                    Image("liegeBackground")
                        .resizable()
                        .frame(width: 900, height: 400)
                        .rotationEffect(Angle(degrees: 90))
                    
                    ForEach(listePostIt.postIts.indices, id: \.self) { index in
                        if listePostIt.postIts[index].isShowed {
                            ExtPostIt(width: 150, postit: $listePostIt.postIts[index])
                                .position(x: listePostIt.postIts[index].x, y: listePostIt.postIts[index].y)
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
                                .simultaneousGesture( // Utilisez simultaneousGesture pour combiner plusieurs gestes
                                    DragGesture()
                                        .onChanged { value in
                                            postItDragOffset = value.translation
                                        }
                                        .onEnded { value in
                                            listePostIt.postIts[index].x += value.translation.width
                                            listePostIt.postIts[index].y += value.translation.height
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
                        ExtZoomPostIt(postit: listePostIt.postIts[postItIndex], showPostIt: $showPostIt)
                            .position(x: 450, y: 250)
                    }
                    if showNewPostIt {
                        ExtNewPostIt(postitlist: listePostIt, showPostIt: $showNewPostIt)
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
