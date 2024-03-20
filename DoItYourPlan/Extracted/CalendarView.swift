//
//  CalendarView.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 12/03/2024.
//

import SwiftUI

struct CalendarView: View {
    @State var selectedDate: Date = Date()
    @State var showModalDayCalendar: Bool = false
    
    var body: some View {
        VStack {
            FormattedDateView(selectedDate: $selectedDate)
                .onTapGesture {
                    showModalDayCalendar.toggle()
                }
            Divider().frame(height: 1)
                DatePicker("Sélectionnez une date", selection: $selectedDate, displayedComponents: [.date])
                    .environment(\.locale, Locale(identifier: "fr_FR"))
                    .datePickerStyle(.graphical)
                    .accentColor(.purple)
                    .frame(width: 300, height: 300)
                    .padding()
                    .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(CustomColor.purpleC.rawValue), lineWidth: 8)
                        )
                    .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 2)
                        )
                    .fontWeight(.semibold)
                    .contentShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 20) 
        }
        .sheet(isPresented: $showModalDayCalendar) {
            DayDetailsModal(day: $selectedDate)
        }
    }
}
#Preview {
    CalendarView()
}
