//
//  Extensionts.swift
//  TableViewDemo
//
//  Created by Naveen  NK on 26/08/22.
//

import Foundation

extension Date {
    func dateToDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let val = dateFormatter.string(from: self)
        return val
    }
    
    func dateToTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss a"
        let val = dateFormatter.string(from: self)
        return val
    }
}

extension String {
    func dateFormate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: self)!
        return date
    }
}
