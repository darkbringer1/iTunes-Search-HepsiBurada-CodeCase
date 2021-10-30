//
//  String+Extension.swift
//  iTunes-Search-HB-CodeCase
//
//  Created by DarkBringer on 30.10.2021.
//

import Foundation

extension String {
    
    public enum DateFormat: String {
        
        case short
        case medium
        case long
        
        var value: String {
            switch self {
                case .short:
                    return "MMM yyyy"
                case .medium:
                    return "dd MM yyyy"
                case .long:
                    return "dd MMMM yyyy"
            }
        }
    }
    public func dateToString(format: DateFormat) -> Self {
        
        var date = self
        
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date2 = formatter1.date(from: date) {
            let formatter2 = DateFormatter()
            formatter2.dateFormat = format.value
            formatter2.locale = Locale(identifier: "en_US_POSIX")
            
            let dateString = formatter2.string(from: date2)
            date = dateString
        }
        return date
    }
    
}
