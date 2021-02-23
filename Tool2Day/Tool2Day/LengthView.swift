//
//  LengthView.swift
//  Tool2Day
//
//  Created by Damien Chailloleau on 22/02/2021.
//

import SwiftUI

struct LengthView: View {
    
    @State private var numberLength = ""
    @State private var measureSelected = 1
    
    let measureName = ["Meters", "KMeters", "Miles", "Feet", "Yards"]
    let measureUnit = [1, 1000, 1609.34, 0.3048, 0.9144]
    
    var metersCalculated: Double {
        let number = Int(numberLength) ?? 0
        let lengthNumber = Double(number)
        let measureSelection = Double(measureUnit[measureSelected])
        let fromMeters = Measurement(value: lengthNumber, unit: UnitLength.meters)
        let result = fromMeters.value * measureSelection
        return result
    }
    
    var kiloMetersCalculated: Double {
        let number = Int(numberLength) ?? 0
        let lengthNumber = Double(number)
        let measureSelection = Double(measureUnit[measureSelected])
        let fromMeters = Measurement(value: lengthNumber, unit: UnitLength.meters)
        let toKiloMeters = fromMeters.converted(to: UnitLength.kilometers)
        let result = toKiloMeters.value * measureSelection
        return result
    }
    
    var milesCalculated: Double {
        let number = Int(numberLength) ?? 0
        let lengthNumber = Double(number)
        let measureSelection = Double(measureUnit[measureSelected])
        let fromMeters = Measurement(value: lengthNumber, unit: UnitLength.meters)
        let toMiles = fromMeters.converted(to: UnitLength.miles)
        let result = toMiles.value * measureSelection
        return result
    }
    
    var feetCalculated: Double {
        let number = Int(numberLength) ?? 0
        let lengthNumber = Double(number)
        let measureSelection = Double(measureUnit[measureSelected])
        let fromMeters = Measurement(value: lengthNumber, unit: UnitLength.meters)
        let toFeet = fromMeters.converted(to: UnitLength.feet)
        let result = toFeet.value * measureSelection
        return result
    }
    
    var yardsCalculated: Double {
        let number = Int(numberLength) ?? 0
        let lengthNumber = Double(number)
        let measureSelection = Double(measureUnit[measureSelected])
        let fromMeters = Measurement(value: lengthNumber, unit: UnitLength.meters)
        let toFeet = fromMeters.converted(to: UnitLength.feet)
        let toYards = toFeet.converted(to: UnitLength.yards)
        let result = toYards.value * measureSelection
        return result
    }
    

    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter a Number :", text: $numberLength)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Choose your Data to convert")) {
                    Picker("", selection: $measureSelected) {
                        ForEach(0 ..< measureUnit.count) {
                            Text("\(self.measureName[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Meters")) {
                    Text("\(metersCalculated, specifier: "%.2f") Meters")
                }
                
                Section(header: Text("Kilometers")) {
                    Text("\(kiloMetersCalculated, specifier: "%.2f") Kilometers")
                }
                
                Section(header: Text("Miles")) {
                    Text("\(milesCalculated, specifier: "%.2f") Miles")
                }
                
                Section(header: Text("Feet")) {
                    Text("\(feetCalculated, specifier: "%.2f") Feet")
                }
                
                Section(header: Text("Yards")) {
                    Text("\(yardsCalculated, specifier: "%.2f") Yards")
                }
            }
            .navigationBarTitle("Lengther")
        }
    }
}

struct LengthView_Previews: PreviewProvider {
    static var previews: some View {
        LengthView()
    }
}
