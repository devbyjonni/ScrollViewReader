//
//  ContentView.swift
//  ScrollViewReader
//
//  Created by Jonni Akesson on 2022-10-12.
//

import SwiftUI

struct ContentView: View {
    
    @State var scrollToIndex = 0
    @State var textFieldText = ""
    
    var body: some View {
        
        VStack {
            TextField("Enter a #", text: $textFieldText)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.3))
                    .frame(height: 50)
                )
                .padding()
                .keyboardType(.numberPad)
            
            Button("Show") {
                if let index = Int(textFieldText) {
                    scrollToIndex = index
                }
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { index in
                        Text("Index: \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(10)
                            .padding()
                            .shadow(radius: 10)
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newValue, anchor: .top)
                        }
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
