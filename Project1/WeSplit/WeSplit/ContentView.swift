//
//  ContentView.swift
//  WeSplit
//
//  Created by Muhammad Usman Tatla on 08/12/2019.
//  Copyright © 2019 Zafus. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [5,10,20,25]
    
    var totalPerPerson: Double {
        //Calculate total per person
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let checkValue = Double(checkAmount) ?? 0
        
        return (checkValue + (checkValue  * (tipSelection/100)))/peopleCount
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0)" + " people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach (0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section {
                    Text("Total per person : $\(totalPerPerson, specifier:  "%.2f")")
                }
                
            }.navigationBarTitle("We Split")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
