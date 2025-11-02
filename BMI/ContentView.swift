//
//  ContentView.swift
//  BMI
//
//  Created by 田口怜央 on 2025/11/02.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enterdNumber: Double = 0.0 // 1: TextFieldに入力した数値の変数
    @State private var originalUnit = "meter"
    private var convertedNumber: Double = 0 // 換算後の数値。
    
    let heightUnits = ["meter", "centimeter"] //身長の単位
    
    var body: some View {
        Form {
            Section("入力") {
                HStack{
                    TextField("Original", value: $enterdNumber, format: .number)
                        .keyboardType(.numberPad)
                        .padding()
                    
                    //Picker("", selection: $heightUnits){
                    //ForEach(heightUnits, id: \.self) { unit in
                    //Text(unit)
                }
            }
            

            
            Section("結果") {
                Text("Text 1")
            }
        }
    }
}

#Preview {
    ContentView()
}
