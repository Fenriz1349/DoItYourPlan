//
//  DatePickerView.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 12/03/2024.
//

import SwiftUI

struct DatePickerView: View {
    @State var selectedDate: Date = Date()
    var body: some View {
        VStack{
            FormattedDateView(selectedDate: selectedDate, omitTime: true)
            Divider().frame(height: 1)
            DatePicker("Sélectionnez une date", selection: $selectedDate,displayedComponents: [.date])
                .datePickerStyle(.graphical)
                        .padding()
                        .fontWeight(.semibold)
        }
            }
}

#Preview {
    DatePickerView()
}
