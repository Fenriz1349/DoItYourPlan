//
//  FinishedProjectScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct FinishedProjectScreen: View {
    var body: some View {
        NavigationView{
            NavigationStack{
                
                ScrollView {
                    NavigationLink(destination:detailsFinishedProjectsScreen()){
                        ZStack{
                            RoundedRectangle (cornerRadius: 25.0)
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
                                        .foregroundColor(.black)
                                }
                                .padding(.trailing, 240.0)
                                
                                HStack{
                                    Image("cosplayGirl3")
                                        .resizable()
                                        .frame(width: 130, height: 100)
                                        .padding(.vertical, 20)
                                        .padding(.leading, -35.0)
                                    
                                    
                                    VStack{
                                        Text("Costume Cosplay BatGirl")
                                        Text("Début : 12/01/2024")
                                        Text("Fin : 24/02/2024")
                                    }.foregroundStyle(.black)
                                } .padding(.top, -20.0)
                                
                            }
                        }
                    } /* rectangle 1 ⬆ */
                    
                    ZStack{
                        RoundedRectangle (cornerRadius: 25.0)
                            .fill(.white)
                            .frame(width: 380, height: 150)
                            .border(.orangeCustom)
                            .padding(.bottom, 15)
                        VStack{
                            ZStack{
                                RoundedRectangle (cornerRadius: 15)
                                    .fill(.orangeCustom)
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
                        RoundedRectangle (cornerRadius: 25.0)
                            .fill(.white)
                            .frame(width: 380, height: 150)
                            .border(.blueCustom)
                            .padding(.bottom, 15)
                        VStack{
                            ZStack{
                                RoundedRectangle (cornerRadius: 15)
                                    .fill(.blueCustom)
                                    .frame(width: 100, height: 30)
                                Text("Dessin")
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
                        RoundedRectangle (cornerRadius: 25.0)
                            .fill(.white)
                            .frame(width: 380, height: 150)
                            .border(.greenCustom)
                            .padding(.bottom, 15)
                        VStack{
                            ZStack{
                                RoundedRectangle (cornerRadius: 15)
                                    .fill(.greenCustom)
                                    .frame(width: 100, height: 30)
                                Text("Jardinage")
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
                            /* rectangle 4 ⬆ */
                            ZStack{
                                RoundedRectangle (cornerRadius: 25.0)
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
                                            .foregroundColor(.black)
                                    }
                                    .padding(.trailing, 240.0)
                                    
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
                                        }.foregroundStyle(.black)
                                    } .padding(.top, -20.0)
                                }/* rectangle 5 ⬆ */
                            }
                            
                    ZStack{
                        RoundedRectangle (cornerRadius: 25.0)
                            .fill(.white)
                            .frame(width: 380, height: 150)
                            .border(.greenCustom)
                            .padding(.bottom, 15)
                        VStack{
                            ZStack{
                                RoundedRectangle (cornerRadius: 15)
                                    .fill(.greenCustom)
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
                        }/* rectangle 6 ⬆ */
                    }
                        }
                    }
                    
                }.navigationBarTitle("Mes projets terminés", displayMode: .inline)
            }
        }
    }
}
#Preview {
    FinishedProjectScreen()
}
