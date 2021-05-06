//
//  Utils.swift
//  touteng-swift
//
//  Created by Eden on 2021/4/28.
//

import Foundation

class Utils {    
    static func getStringFromTimeStamp(_ time: Int, dateFormat:String="yyyy-MM-dd") -> String {
        let interval:TimeInterval = TimeInterval.init(time)
        let date:Date = Date(timeIntervalSince1970: interval)
        let timeZone = TimeZone.init(identifier: "UTC")
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let dateString = formatter.string(from: date)
        return dateString.components(separatedBy: " ").first!
    }
    
}
