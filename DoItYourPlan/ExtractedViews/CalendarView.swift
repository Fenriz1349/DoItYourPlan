//
//  CalendarView.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 12/03/2024.
//

import SwiftUI
import FSCalendar

struct CalendarView: View {
    @State var selectedDate: Date = Date()
    @State var showModalDayCalendar : Bool = false
    var body: some View {
        VStack{
            CalendarViewRepresentable(selectedDate: $selectedDate,showModal: $showModalDayCalendar)
                .frame(width: 275,height: 275)
                .padding()
        }
        .sheet(isPresented: $showModalDayCalendar) {
                    DayDetailsModal(day: $selectedDate)
                }
        
    }
}

struct CalendarViewRepresentable: UIViewRepresentable {
    typealias UIViewType = FSCalendar

    fileprivate var calendar = FSCalendar()    
    @Binding var selectedDate: Date
    @Binding var showModal : Bool
    
    func makeUIView(context: Context) -> FSCalendar {
        calendar.firstWeekday = 2
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        calendar.locale = Locale(identifier: "fr_FR")
              return calendar
      }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject,
          FSCalendarDelegate, FSCalendarDataSource {
            var parent: CalendarViewRepresentable

            init(_ parent: CalendarViewRepresentable) {
                self.parent = parent
            }
        func calendar(_ calendar: FSCalendar,
                                didSelect date: Date,
                                at monthPosition: FSCalendarMonthPosition) {
                    parent.selectedDate = date
            parent.showModal = true
                }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
