//
//  Extensions.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 27.12.2020.
//

import Foundation

extension String {
    
    func toTwoDigitFloatString() -> String
    {
        //replece to two digit float
        return String(format: "£%.2f", Float(self) ?? 0).replacingOccurrences(of: ".", with: ",")
    }
    
    func toFloat() -> Float
    {
        return Float(self.replacingOccurrences(of: ",", with: ".")) ?? 0
    }
    
}
