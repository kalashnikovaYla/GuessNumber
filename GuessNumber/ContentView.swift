//
//  ContentView.swift
//  GuessNumber
//
//  Created by sss on 17.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShowAlert = false
    @State var textInput = ""
    @State var name = ""
    @State var numberInput = ""
    @State var isOpen = false
    @State var isShowSecondAlert = false
    @State var result = "Вы проиграли 😢"
    
    @FocusState var isFocused: Bool
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [Color.white, Color.blue], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                if isOpen {
                    
                    Text("""
                    \(name)!
                    Предлагаю тебе отгадать число от 1 до 100
                    """)
                        
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.purple)
                    
                    
                    TextField("Введите число от 1 до 100", text: $numberInput)
                        .textFieldStyle(.roundedBorder)
                        .tint(.blue)
                        .font(.system(size: 24))
                        .keyboardType(.decimalPad)
                        .padding(.horizontal, 12)
                        .foregroundColor(.blue)
                        .padding()
                        .focused($isFocused)
                    
                    Button {
                        isFocused = false
                        
                        isShowSecondAlert = true
                        
                        let number = Int.random(in: 1...100)
                        if numberInput == String(number) {
                            result = "Поздравляю с победой 🥳"
                        }
                        
                    } label: {
                        
                        Text("Проверить")
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .tint(.white)
                            .background(.purple)
                            .cornerRadius(34)
                    }.alert(Text(result), isPresented: $isShowSecondAlert) {
                        
                        Button {
                        } label: {
                            Text("Ok")
                        }
                    }
                    
                } else {
                    Text("""
                         Привет!
                         Давай познакомимся!
                         """)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.purple)
                    
                    Text("🥳")
                        .font(.largeTitle)
                        .multilineTextAlignment(.leading)
                    
                    Button {
                        isShowAlert = true
                        
                    } label: {
                        Text("Ввести имя")
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .tint(.white)
                            .background(.purple)
                            .cornerRadius(34)
                        
                    }
                    .alert(Text("Знакомство"), isPresented: $isShowAlert) {
                        
                        TextField("Имя", text: $textInput)
                        Button {
                            name = textInput
                            isOpen = true
                        } label: {
                            Text("Сохранить")
                        }
                        Button(role: .cancel) {
                        } label: {
                            Text("Отмена")
                        }

                    } message: {
                        Text("Введите свое имя")
                    }
                }
                
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
