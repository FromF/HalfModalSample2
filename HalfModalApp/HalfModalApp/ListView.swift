//
//  ListView.swift
//  HalfModalApp
//
//  Created by 藤治仁 on 2023/04/27.
//

import SwiftUI

struct ListView: View {
    @State var selectedCity = ""
    @State var isShowSheet = false
    var body: some View {
        VStack {
            List {
                ForEach(cityList, id: \.self) { city in
                    Button {
                        selectedCity = city
                    } label: {
                        Text(city)
                    }
                }
            }
            .listStyle(.inset)
            .onChange(of: selectedCity) { _ in
                isShowSheet.toggle()
            }
            .sheet(isPresented: $isShowSheet) {
                SubView(city: selectedCity)
                // ハーフモーダルの各サイズ指定
                .presentationDetents([.fraction(0.3),.medium, .large])
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
