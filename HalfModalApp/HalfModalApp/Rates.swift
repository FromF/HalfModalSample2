//
//  Rates.swift
//  HalfModalApp
//
//  Created by 藤治仁 on 2023/04/27.
//

import Foundation
import AVFoundation

enum Rates: CaseIterable {
    case slow
    case normal
    case high
    
    var name: String {
        switch self {
        case .slow:
            return "遅い"
        case .normal:
            return "普通"
        case .high:
            return "早い"
        }
    }
    
    var rate: Float {
        // 0.0 - 1.0の間にする
        switch self {
        case .slow:
            return 0.3
        case .normal:
            return AVSpeechUtteranceDefaultSpeechRate
        case .high:
            return 0.6
        }
    }
}
