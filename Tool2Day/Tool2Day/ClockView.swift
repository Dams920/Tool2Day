//
//  ClockView.swift
//  Tool2Day
//
//  Created by Damien Chailloleau on 17/02/2021.
//

import SwiftUI

struct ClockView: View {
    
    @State private var numberString = ""
    @State private var timeSelected = 1
    
    let timeData = ["Seconds", "Minutes", "Hours", "Days"]
    let numberData = [1, 60, 3600, 86400]
    
    var secondsCalculated: Double {
        let numbers = Int(numberString) ?? 0
        let time = Double(numbers)
        let timeSelection = Double(numberData[timeSelected])
        let lengthTime = Measurement(value: time, unit: UnitDuration.seconds)
        let result = lengthTime.value * timeSelection
        return result
    }
    
    var minutesCalculated: Double {
        let numbers = Int(numberString) ?? 0
        let time = Double(numbers)
        let timeSelection = Double(numberData[timeSelected])
        let lengthTime = Measurement(value: time, unit: UnitDuration.seconds)
        let lengthMin = lengthTime.converted(to: UnitDuration.minutes)
        let result = lengthMin.value * timeSelection
        return result
    }
    
    var hoursCalculated: Double {
        let numbers = Int(numberString) ?? 0
        let time = Double(numbers)
        let timeSelection = Double(numberData[timeSelected])
        let lengthTime = Measurement(value: time, unit: UnitDuration.seconds)
        let lengthHour = lengthTime.converted(to: UnitDuration.hours)
        let result = lengthHour.value * timeSelection
        return result
    }
    
    var daysCalculated: Double {
        let numbers = Int(numberString) ?? 0
        let time = Double(numbers)
        let timeSelection = Double(numberData[timeSelected])
        let lengthTime = Measurement(value: time, unit: UnitDuration.seconds)
        let lengthHour = lengthTime.converted(to: UnitDuration.hours)
        let result = lengthHour.value * timeSelection
        return result / 24
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter the Numbers :", text: $numberString)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("What time do you need ?")) {
                    Picker("", selection: $timeSelected) {
                        ForEach(0 ..< numberData.count) {
                            Text(self.timeData[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Seconds")) {
                    Text("\(secondsCalculated, specifier: "%.0f") seconds")
                }
                
                Section(header: Text("Minutes")) {
                    Text("\(minutesCalculated, specifier: "%.0f") minutes")
                }
                
                Section(header: Text("Hours")) {
                    Text("\(hoursCalculated, specifier: "%.0f") hours")
                }
                
                Section(header: Text("Days")) {
                    Text("\(daysCalculated, specifier: "%.0f") days")
                }
            }
            .navigationBarTitle("Cloker")
        }
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
