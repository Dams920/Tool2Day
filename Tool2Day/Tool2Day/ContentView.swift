//
//  ContentView.swift
//  Tool2Day
//
//  Created by Damien Chailloleau on 17/02/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0, green: 0.66, blue: 1, opacity: 1)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        NavigationLink(destination: LengthView()) {
                            OptionView(imageText: "length")
                        }
                        NavigationLink(destination: ClockView()) {
                            OptionView(imageText: "clock")
                        }
                    }
                }
            }
            .navigationBarTitle("Tool2Day", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
