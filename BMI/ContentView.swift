//
//  ContentView.swift
//  BMI
//
//  Created by 田口怜央 on 2025/11/02.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - 変数保存
    
    @State private var height: Double = 0.0
    @State private var weight: Double = 0.0
    @State private var unit = "meter"
    @FocusState private var isFocused: Bool
    
    let units = ["meter", "centimeter"]
    
    // MARK: - BMI計算式
    
    var bmi: Double {
        switch unit {
        case "centimeter":
            return weight / ((height/100) * (height/100))
        default:
            return weight / (height * height)
        }
    }
    
    // MARK: - BMI評価判定
    
    var bmiCategory: String {
        if height == 0 || weight == 0 {
            return ""
        }
            switch bmi {
        case ..<18.5:
            return "低体重"
        case 18.5..<25:
            return "普通体重"
        case 25..<30:
            return "肥満（1度）"
        case 30..<35:
            return "肥満（2度）"
        case 35..<40:
            return "肥満（3度）"
        default:
            return "肥満（4度）"
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        Form {
            Section("入力") {
                HStack{
                    TextField("", value: $height, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                        .toolbar {
                            ToolbarItem(placement: .keyboard) {
                                HStack{
                                    Spacer()
                                    Button {
                                        isFocused = false
                                    } label: {
                                        Text("Done")
                                    }
                                }
                            }
                        }
                    
                    Picker("", selection: $unit){
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                
                HStack{
                    TextField("", value: $weight, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    
                    Text("kg")
                }
            }
            
            Section("結果") {
                Text("\(bmi, specifier: "%.2f")")
//                Task(bmiCategory)
                
            }
            Section("評価") {
                Text(bmiCategory)
            }
        }
    }
}

#Preview {
    ContentView()
}
