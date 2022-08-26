//
//  DataModel.swift
//  TableViewDemo
//
//  Created by Naveen  NK on 26/08/22.
//

import Foundation

// MARK: - TimeSeries
struct TimeSeries: Codable {
    var metaData: MetaData?
    var timeSeries5Min: [String: TimeSeries5Min]?

    enum CodingKeys: String, CodingKey {
        case metaData = "Meta Data"
        case timeSeries5Min = "Time Series (5min)"
    }
}

// MARK: - MetaData
struct MetaData: Codable {
    var the1Information, the2Symbol, the3LastRefreshed, the4Interval: String?
    var the5OutputSize, the6TimeZone: String?

    enum CodingKeys: String, CodingKey {
        case the1Information = "1. Information"
        case the2Symbol = "2. Symbol"
        case the3LastRefreshed = "3. Last Refreshed"
        case the4Interval = "4. Interval"
        case the5OutputSize = "5. Output Size"
        case the6TimeZone = "6. Time Zone"
    }
}

// MARK: - TimeSeries5Min
struct TimeSeries5Min: Codable {
    var the1Open, the2High, the3Low, the4Close: String?
    var the5Volume: String?

    enum CodingKeys: String, CodingKey {
        case the1Open = "1. open"
        case the2High = "2. high"
        case the3Low = "3. low"
        case the4Close = "4. close"
        case the5Volume = "5. volume"
    }
}
