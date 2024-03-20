//
//  SettingsScreen.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 11/03/2024.
//

import SwiftUI

struct SettingsScreen: View {
   
        @State private var isDarkMode = false
           @State private var stageNotifications = true
           @State private var projectNotifications = true
           @State private var emailNotifications = false
           
           var body: some View {
               NavigationView {
                   Form {
                       Section(header: Text("GÉNÉRAL")) {
                           NavigationLink(destination: Text("S'abonner à Pro")) {
                               HStack {
                                   Image(systemName: "star.fill")
                                       .foregroundColor(.blue)
                                   Text("S'abonner à Pro")
                               }
                           }
                       }
                       Section(header: Text("APPARENCE")) {
                                          Toggle(isOn: $isDarkMode) {
                                              Text(isDarkMode ? "Mode Sombre" : "Mode Clair")
                                     
                           }
                       }
                       
                       Section(header: Text("OPTIONS")) {
                           NavigationLink(destination: Text("Langue")) {
                               HStack {
                                   Image(systemName: "globe")
                                   Text("Langue")
                               }
                           }
                           NavigationLink(destination: Text("Profil")) {
                               HStack {
                                   Image(systemName: "person.crop.circle")
                                   Text("Profil")
                               }
                           }
                       }
                       
                       Section(header: Text("NOTIFICATIONS")) {
                           Toggle(isOn: $stageNotifications) {
                               Text("Notifications des étapes")
                           }
                           Toggle(isOn: $projectNotifications) {
                               Text("Notifications des projets")
                           }
                           Toggle(isOn: $emailNotifications) {
                               Text("E-mails de notification")
                           }
                       }
                       
                       Section(header: Text("À PROPOS")) {
                           NavigationLink(destination: Text("Information")) {
                               HStack {
                                   Image(systemName: "info.circle")
                                   Text("Information")
                               }
                           }
                           NavigationLink(destination: Text("Aide")) {
                               HStack {
                                   Image(systemName: "questionmark.circle")
                                   Text("Aide")
                               }
                           }
                           NavigationLink(destination: Text("Confidentialité")) {
                               HStack {
                                   Image(systemName: "lock.circle")
                                   Text("Confidentialité")
                               }
                           }
                           NavigationLink(destination: Text("Conditions de Service")) {
                               HStack {
                                   Image(systemName: "doc.text")
                                   Text("Conditions de Service")
                               }
                           }
                       }
                   }
                   .navigationBarTitle("Paramètres", displayMode: .inline)
               }
           }
       }
    

#Preview {
    SettingsScreen()
}
