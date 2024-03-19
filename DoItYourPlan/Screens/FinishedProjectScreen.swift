//
//  FinishedProjectScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct FinishedProjectScreen: View {
    var body: some View {
            VStack{
                Text("Mes projets terminés")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 152)
                    .padding(.vertical, 10)
                    .border(Color.gray, width: 1)
                
                ScrollView {
                ZStack{
                    RoundedRectangle (cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(.white)
                        .frame(width: 380, height: 150)
                        .border(.purpleCustom)
                        .padding(.bottom, 15)
                    VStack{
                        ZStack{
                            RoundedRectangle (cornerRadius: 15)
                                .fill(.purpleCustom)
                                .frame(width: 100, height: 30)
                            Text("Couture")
                                .multilineTextAlignment(.leading)
                        } .padding(.trailing, 240.0)
                        
                        HStack{
                            Image("coussinRecycle")
                                .resizable()
                                .frame(width: 150, height: 100, alignment: .topLeading)
                                .padding(.vertical, 20)
                                .padding(.leading, -35.0)
                            
                            VStack{
                                Text("Coussins recyclés")
                                Text("Début : 12/01/2024")
                                Text("Fin : 24/02/2024")
                            }
                        } .padding(.top, -20.0)
                        
                    }
                } /* rectangle 1 ⬆ */
                
                ZStack{
                    RoundedRectangle (cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(.white)
                        .frame(width: 380, height: 150)
                        .border(.purpleCustom)
                        .padding(.bottom, 15)
                    VStack{
                        ZStack{
                            RoundedRectangle (cornerRadius: 15)
                                .fill(.purpleCustom)
                                .frame(width: 100, height: 30)
                            Text("Peinture")
                                .multilineTextAlignment(.leading)
                        } .padding(.trailing, 240.0)
                        
                        HStack{
                            Image("peintureMurSalon")
                                .resizable()
                                .frame(width: 150, height: 100, alignment: .topLeading)
                                .padding(.vertical, 20)
                                .padding(.leading, -35.0)
                            
                            VStack{
                                Text("Peinture mur Salon")
                                Text("Début : 01/12/2023")
                                Text("Fin : 17/12/2023")
                            }
                        } .padding(.top, -20.0)
                        
                    }
                } /* rectangle 2 ⬆ */
                
                ZStack{
                    RoundedRectangle (cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(.white)
                        .frame(width: 380, height: 150)
                        .border(.purpleCustom)
                        .padding(.bottom, 15)
                    VStack{
                        ZStack{
                            RoundedRectangle (cornerRadius: 15)
                                .fill(.purpleCustom)
                                .frame(width: 100, height: 30)
                            Text("Craft")
                                .multilineTextAlignment(.leading)
                        } .padding(.trailing, 240.0)
                        
                        HStack{
                            Image("cadeauCharlie")
                                .resizable()
                                .frame(width: 150, height: 100, alignment: .topLeading)
                                .padding(.vertical, 20)
                                .padding(.leading, -52.0)
                            
                            VStack{
                                Text("Cadeau Charlie")
                                Text("Début : 01/12/2023")
                                Text("Fin : 15/02/2024")
                            }
                        } .padding(.top, -20.0)
                        
                    }
                } /* rectangle 3 ⬆ */
                ZStack{
                    RoundedRectangle (cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(.white)
                        .frame(width: 380, height: 150)
                        .border(.purpleCustom)
                        .padding(.bottom, 15)
                    VStack{
                        ZStack{
                            RoundedRectangle (cornerRadius: 15)
                                .fill(.purpleCustom)
                                .frame(width: 100, height: 30)
                            Text("Jardinage")
                                .multilineTextAlignment(.leading)
                        } .padding(.trailing, 240.0)
                        
                        HStack{
                            Image("rangementJardin")
                                .resizable()
                                .frame(width: 150, height: 100, alignment: .topLeading)
                                .padding(.vertical, 20)
                            
                            
                            VStack{
                                Text("Rangement tuyau et bac à fleurs")
                                Text("Début : 01/08/2023")
                                Text("Fin : 07/09/2023")
                            }
                        } .padding(.top, -20.0)
                    }
                } /* rectangle 4 ⬆ */
                
                ZStack{
                    RoundedRectangle (cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(.white)
                        .frame(width: 380, height: 150)
                        .border(.purpleCustom)
                        .padding(.bottom, 15)
                    VStack{
                        ZStack{
                            RoundedRectangle (cornerRadius: 15)
                                .fill(.purpleCustom)
                                .frame(width: 100, height: 30)
                            Text("Menuiserie")
                                .multilineTextAlignment(.leading)
                        } .padding(.trailing, 240.0)
                        
                        HStack{
                            Image("jardiniereColor")
                                .resizable()
                                .frame(width: 150, height: 100, alignment: .topLeading)     .padding(.vertical, 20)
                                .padding(.leading, -35.0)
                            
                            VStack{
                                Text("Jardinières colorés")
                                Text("Début : 20/08/2023")
                                Text("Fin : 30/08/2023")
                            }
                        } .padding(.top, -20.0)
                        
                    }
                } /* rectangle 5 ⬆ */
            }
        }
    }
}
#Preview {
    FinishedProjectScreen()
}
