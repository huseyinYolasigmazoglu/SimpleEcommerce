//
//  Extensions.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 27.12.2020.
//

import Foundation

extension String {
    
    func toTwoDigitFloat() -> String
    {
        //replece to two digit float
        return String(format: "£%.2f", Float(self)!).replacingOccurrences(of: ".", with: ",")
    }
    
}
