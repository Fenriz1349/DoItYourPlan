//
//  InspirationView.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 14/03/2024.
//

import SwiftUI

struct InspirationView: View {
    @State var postIts : [PostIt] = [
        PostIt(name: "Post It 1",x: 350,y: 100, rotation : -5,color: .yellowC, contents: ["test"])
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
                    ForEach(postIts.indices, id: \.self) { index in
                        ExtPostIt(postit: $postIts[index])
                            .position(x: postIts[index].x, y: postIts[index].y)
                            .rotationEffect(Angle(degrees: postIts[index].rotation))
                    }
                    
                        
                    
                }
            }
            
            
        }
        
    }
}

#Preview {
    InspirationView()
}
