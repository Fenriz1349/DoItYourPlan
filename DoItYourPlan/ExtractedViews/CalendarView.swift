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
    var body: some View {
        VStack{
            Text("mon planning")
            FormattedDate(selectedDate: selectedDate, omitTime: true)
            CalendarViewRepresentable(selectedDate: $selectedDate)
                .frame(width: 275,height: 275)
        }
    }
}

struct CalendarViewRepresentable: UIViewRepresentable {
    typealias UIViewType = FSCalendar

    fileprivate var calendar = FSCalendar()
    
    @Binding var selectedDate: Date
    
    func makeUIView(context: Context) -> FSCalendar {
              // Setting delegate and dateSource of calendar to the
              // values we get from Coordinator
              calendar.delegate = context.coordinator
              calendar.dataSource = context.coordinator
              // returning the intialized calendar
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
                }
    }
}
#Preview {
    CalendarView()
}
