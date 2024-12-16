//
//  Double.swift
//  CryptoBit
//
//  Created by Murad Akhundov on 16.12.24.
//

import Foundation

extension Double {
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.multiplier = 1.7 //This should be not constant but changeable with AZN - USD relation
        return formatter
    }
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    
    func toPercent() -> String {
        guard let numberAsString = numberFormatter.string(for: self) else { return ""}
        return numberAsString + "%"
    }
}
