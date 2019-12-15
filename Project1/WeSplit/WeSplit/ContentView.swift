//
//  ContentView.swift
//  WeSplit
//
//  Created by Muhammad Usman Tatla on 08/12/2019.
//  Copyright © 2019 Zafus. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermoine", "Ron"]
    @State private var selectedStudent = 0
    
    var body: some View {
        
        VStack{
            Picker("Chose your Student", selection: $selectedStudent) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            Text("You chose: \(students[selectedStudent])")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
