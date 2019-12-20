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
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2
    
    let tipPercentages = [5,10,20,25]
    
    var totalPerPerson: Double {
        //Calculate total per person
        let numOfPeople = Double(numberOfPeople) ?? 1
        let peopleCount = numOfPeople == 0 ? 1 : numOfPeople
        let tipSelection = Double(tipPercentages[tipPercentage])
        let checkValue = Double(checkAmount) ?? 0
        
        return (checkValue + (checkValue  * (tipSelection/100)))/peopleCount
    }
    
    var totalExpense: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let checkValue = Double(checkAmount) ?? 0
        return (checkValue + (checkValue  * (tipSelection/100)))
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                    TextField("Number of People", text: $numberOfPeople).keyboardType(.decimalPad)
                    
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach (0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Total Expenditure including Tip")){
                    Text("Amount: $\(totalExpense, specifier: "%.2f")")
                }
                
                Section(header: Text("Amount per person")) {
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
