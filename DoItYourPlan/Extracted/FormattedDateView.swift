//
//  FormattedDate.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 12/03/2024.
//

import SwiftUI

struct FormattedDateView: View {

    @Binding var selectedDate: Date
    var body: some View {
        HStack{
            Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
            Spacer()
            Text("consulter")
            Image(systemName: "chevron.right")
        }
        .frame(width: 300)
        .font(.system(size: 24))
        .bold()
        .foregroundColor(Color("purpleCustom"))
        .padding()
        .animation(.spring(), value: selectedDate)
    }
}

#Preview {
    FormattedDateView(selectedDate: .constant(Date()))
}
