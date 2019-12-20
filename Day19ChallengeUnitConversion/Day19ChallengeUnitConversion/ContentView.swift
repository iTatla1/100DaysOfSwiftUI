//
//  ContentView.swift
//  Day19ChallengeUnitConversion
//
//  Created by Muhammad Usman on 20/12/2019.
//  Copyright © 2019 Muhammad Usman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    @State private var enteredValue = ""
    
    let units = ["Hours","Minutes","Seconds"]
    
    var enteredDouble: Double {
        return Double(enteredValue) ?? 0
    }
    
    var resultValue: Double {
        if inputUnit == 0 {
            if outputUnit == 0 {
                return enteredDouble
            }
            else if outputUnit == 1 {
                return enteredDouble * 60
            }
            else {
                return enteredDouble * 60 * 60
            }
        }
        else if inputUnit == 1 {
            if outputUnit == 0 {
                return enteredDouble / 60
            }
            else if outputUnit == 1 {
                return enteredDouble
            }
            else {
                return enteredDouble / 60 / 60
            }
        }
        else{
            if outputUnit == 0 {
                return enteredDouble / 60 / 60
            }
            else if outputUnit == 1 {
                return enteredDouble / 60
            }
            else {
                return enteredDouble
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Choose Input Unit")) {
                    Picker("Choose Input Unit", selection: $inputUnit) {
                        ForEach (0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("Choose output Unit")) {
                    Picker("Choose Output Unit", selection: $outputUnit) {
                        ForEach (0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                TextField("Enter time to convert", text: $enteredValue).keyboardType(.decimalPad)
                
                Section(header: Text("Converted Value")) {
                    Text("Value: \(resultValue, specifier: "%.2f")")
                }
                
            }.navigationBarTitle("Unit Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
