//
//  FinishedProjectScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct FinishedProjectScreen: View {
    var body: some View {
        ScrollView {
            VStack{
//                Text("Retour")
//                    .navigationTitle("ProfilScreen")
//                    .navigationBarBackButtonHidden(true)
//                    .padding(.leading, -150.0)
//                
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
                                .padding(.vertical, 20)
                            
                            VStack{
                                Text("Coussins recyclés")
                                Text("début : 12/01/2024")
                                Text("fin :  2/12/23")
                                
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
                            Text("Couture")
                                .multilineTextAlignment(.leading)
                        } .padding(.trailing, 240.0)
                        
                        HStack{
                            Image("peintureMurSalon")
                                .padding(.vertical, 20)
                            
                            VStack{
                                Text("Peinture mur Salon")
                                Text("début : 01/12/23")
                                Text("fin : 17/12/23")
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
                                .padding(.vertical, 20)
                            
                            VStack{
                                Text("Cadeau Charlie")
                                Text("début : 01/12/23")
                                Text("fin :  2/12/23")
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
                                .padding(.vertical, 20)
                            
                            VStack{
                                Text("Rangement tuyau et bac à fleur")
                                Text("début : 12/01/2024")
                                Text("fin :  2/12/23")
                                
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
                            Text("Jardin")
                                .multilineTextAlignment(.leading)
                        } .padding(.trailing, 240.0)
                        
                        HStack{
                            Image("jardiniereColor")
                                .padding(.vertical, 20)
                            
                            VStack{
                                Text("Jardinières colorés")
                                Text("début : 12/01/2024")
                                Text("fin : 2/12/23")
                                
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
