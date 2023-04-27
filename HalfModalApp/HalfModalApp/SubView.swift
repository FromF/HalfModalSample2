//
//  SubView.swift
//  HalfModalApp
//
//  Created by 藤治仁 on 2023/04/27.
//

import SwiftUI
import AVFoundation


struct SubView: View {
    @State var city: String
    @State private var rate: Float = AVSpeechUtteranceDefaultSpeechRate
    // AVSpeechSynthesizerのインスタンスを生成
    private let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        VStack {
            HStack {
                Text(city)
                    .font(.largeTitle)
                Button {
                    let utterance = AVSpeechUtterance(string: city)
                    let voice = AVSpeechSynthesisVoice(language: "ja-JP")
                    utterance.voice = voice
                    utterance.rate = rate
                    synthesizer.speak(utterance)
                } label: {
                    Text("🇯🇵")
                        .font(.largeTitle)
                        .padding(.leading)
                }
                .padding()
                
                Button {
                    let utterance = AVSpeechUtterance(string: "中文")
                    let voice = AVSpeechSynthesisVoice(language: "zh-Hans")
                    utterance.voice = voice
                    utterance.rate = rate
                    synthesizer.speak(utterance)
                } label: {
                    Text("🇨🇳")
                        .font(.largeTitle)
                }
                .padding(.leading)
                
            } // HStack
            
            Picker(selection: $rate, label: Text("")) {
                ForEach(Rates.allCases, id:\.self) { speed in
                    Text("\(speed.name)")
                        .tag(speed.rate)
                }
            }
            .pickerStyle(SegmentedPickerStyle())    // セグメントピッカースタイルの指定

        } // VStack
    }
}

struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView(city: "東京都")
    }
}
