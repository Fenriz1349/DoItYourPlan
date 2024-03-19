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
                    .background(Color("purpleCustom"), in : RoundedRectangle(cornerRadius: 20))
                    .environment(\.locale, Locale(identifier: "fr_FR"))
                    .datePickerStyle(.graphical)
                    .frame(width: 300, height: 300)
                    .padding()
                    .fontWeight(.semibold)
                    .contentShape(Rectangle())
        }
        .sheet(isPresented: $showModalDayCalendar) {
            DayDetailsModal(day: $selectedDate)
        }
    }
}
#Preview {
    CalendarView()
}
