//
//  CalendarView.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 12/03/2024.
//

import SwiftUI
//import FSCalendar

struct CalendarView: View {
    
    @State var selectedDate: Date = Date()
    @State var showModalDayCalendar : Bool = false
    var body: some View {
        VStack{
           
            Divider().frame(height: 1)
            DatePicker("Sélectionnez une date", selection: $selectedDate,displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .frame(width: 275,height: 275)
                        .padding()
                        .fontWeight(.semibold)
                        .onTapGesture {
                            showModalDayCalendar = true
                                        }
        }
        .sheet(isPresented: $showModalDayCalendar) {
                    DayDetailsModal(day: $selectedDate)
                }
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
