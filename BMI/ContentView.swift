//
//  ContentView.swift
//  BMI
//
//  Created by 田口怜央 on 2025/11/02.
//

import SwiftUI

struct ContentView: View {
    
    @State private var height: Double = 0.0
    @State private var weight: Double = 0.0
    @State private var unit = "meter"
    
    let units = ["meter", "centimeter"]
    
    var body: some View {
        Form {
            Section("入力") {
                HStack{
                    TextField("", value: $height, format: .number)
                        .keyboardType(.numberPad)
                    
                    Picker("", selection: $unit){
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                
                HStack{
                    TextField("", value: $weight, format: .number)
                        .keyboardType(.numberPad)
                    
                    Text("kg")
                }
            }
            
            Section("結果") {
                Text("NaN")
            }
        }
        
    }
}
#Preview {
    ContentView()
}
