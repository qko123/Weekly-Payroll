//
//  ContentView.swift
//  Weekly Payroll
//
//  Created by Quinn Kozak on 9/23/22.
//

import SwiftUI

struct ContentView: View {
    @State private var hourlyWageTextField = ""
    @State private var hoursWorkedTextField = ""
    @State private var pay = 0.0
    var body: some View {
        VStack {
            CustomText(text: "Weekly Payroll")
                .padding()
            CustomTextField(placeholder: "Hourly Pay", variable: $hourlyWageTextField)
            CustomTextField(placeholder: "Hours Worked", variable: $hoursWorkedTextField)
            Button("Calculate") {
                
                pay = 0.0
                if let hourlyWage = Double(hourlyWageTextField) {
                    if let hoursWorked = Double(hoursWorkedTextField) {
                        pay = calculateGrossPay(hourlyWage: hourlyWage, hoursWorked: hoursWorked)
                    }
                }
            }
            .padding()
            CustomText(text: "Gross Pay")
            CustomText(text: "$" + String(format: "%.2f",pay))
            Spacer()
        }
    }
    func calculateGrossPay(hourlyWage: Double, hoursWorked: Double) -> Double {
        if hoursWorked <= 40
        {
            return hourlyWage * hoursWorked
        }
        else {
            return (hoursWorked - 40) * hourlyWage * 1.5 + hourlyWage * 40
        }
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct CustomTextField: View {
    let placeholder : String
    let variable : Binding<String>
    var body: some View {
        TextField(placeholder, text:variable)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            .frame(width: 200, height: 30, alignment: .center)
            .font(.body)
            .padding()
    }
}
struct CustomText: View {
    let text : String
    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.bold)
    }
}
