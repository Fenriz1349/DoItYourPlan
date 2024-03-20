//
//  FormattedDate.swift
//  DoItYourPlan
//
//  Created by apprenant68 on 12/03/2024.
//

import SwiftUI

struct FormattedDateView: View {
    @State private var isPurple = true
    @Binding var selectedDate: Date
    var body: some View {
        HStack{
            Text(selectedDate.formatted(date: .abbreviated, time: .omitted))
            Spacer()
            Text("consulter")
            Image(systemName: "chevron.right")
                .foregroundColor(isPurple ? Color("purpleCustom") : .black)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                        withAnimation {
                            self.isPurple.toggle()
                        }
                    }
                }
        }
        .frame(width: 300)
        .font(.system(size: 24))
        .bold()
        
        .padding()
        .animation(.spring(), value: selectedDate)
    }
}

#Preview {
    FormattedDateView(selectedDate: .constant(Date()))
}
