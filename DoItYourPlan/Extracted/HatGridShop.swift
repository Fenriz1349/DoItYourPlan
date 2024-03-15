//
//  HatGridShop.swift
//  DoItYourPlan
//
//  Created by apprenant49 on 15/03/2024.
//


import SwiftUI

struct HatGridShop: View {
    
   
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                
                   
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.1))
                            VStack{
                                HStack {
                                    Spacer()
                                    
                                Image("hatShopScreen")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
            }
            .padding()
        }
       
        
        
    }

#Preview {
    HatGridShop()
}
