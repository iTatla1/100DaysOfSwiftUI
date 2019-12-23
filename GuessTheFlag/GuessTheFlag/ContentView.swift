//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Muhammad Usman on 23/12/2019.
//  Copyright © 2019 Muhammad Usman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    var body: some View {
        Button("Tap Me") {
            self.showAlert = true
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("DAY 20"), message: Text("ALL DONE CONGRATULATIONS"), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
