//
//  ModelForTradePage.swift
//  TradingApp
//
//  Created by wOOx Technology on 11/11/22.
//

import Foundation

struct ModelForTradeApp {
    struct ModelForTopCV {
        static let countries: [String] = [
            "US", "UK", "Germany", "France", "India", "Nepal", "Bhutan"
        ]
    }
    struct ModelForMainTV {
        static let mainText: [String] = [
            "1-800 FLOWERS.COM",
            "10x Genomics, Inc.",
            "180 Degree Capital Corp.",
            "180 Framing lives corp.",
        ]
        static let sellText: [String] = [
            "6.31",
            "32.89",
            "5.94",
            "0.78",
            "6.31"
        ]
        static let buyText: [String] = [
            "6.37",
            "32.88",
            "6.02",
            "0.85",
            "6.37"
        ]
        static let percentText: [String] = [
            "0%",
            "-0.06%",
            "-0.06%",
            "1%",
            "2%",
        ]
        
    }
}
