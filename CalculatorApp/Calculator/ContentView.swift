//
//  ContentView.swift
//  Calculator
//
//  Created by Marcel Raner on 19.03.21.
//

import SwiftUI
import MyMathFramework

struct ContentView: View {
    
    @State private var value_a: String = "3"
    @State private var value_b: String = "4"
    @State private var result: String = "7"
    
    var body: some View {
        VStack() {
            HStack() {
                Text("A:")
                TextField("Enter your name", text: $value_a)
                    .border(Color.black)
                Text("B: ")
                TextField("Enter your name", text: $value_b)
                    .border(Color.black)
            }
            .padding()
            
            HStack() {
                Button(action: {
                    var iresult: Int32 = 0
                    MyMathFramework.add(result: &iresult, a: Int32(value_a)!, b: Int32(value_b)!)
                    result = String(iresult)
                }, label: {
                    Text("add")
                })
                
                Spacer()
                
                Button(action: {
                    var iresult: Int32 = 0
                    MyMathFramework.subtract(result: &iresult, a: Int32(value_a)!, b: Int32(value_b)!)
                    result = String(iresult)
                }, label: {
                    Text("subtract")
                })
                
                Spacer()
                
                Button(action: {
                    var iresult: Int32 = 0
                    MyMathFramework.multiply(result: &iresult, a: Int32(value_a)!, b: Int32(value_b)!)
                    result = String(iresult)
                }, label: {
                    Text("multiply")
                })
                
                Spacer()
                
                Button(action: {
                    var iresult: Int32 = 0
                    MyMathFramework.divide(result: &iresult, a: Int32(value_a)!, b: Int32(value_b)!)
                    result = String(iresult)
                }, label: {
                    Text("divide")
                })
            }
            .padding()
            
            Text("Result: \(result)")
                .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
