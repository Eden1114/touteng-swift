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
    
    
    static func http2https(_ httpUrl:String) -> String {
        var s = httpUrl
        if s.hasPrefix("http://") {
            s = s.replacingOccurrences(of: "http://", with: "https://")
        }
        return s
    }
    
    
    static func loadJsonData<T: Decodable> (_ fileName: String) -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            fatalError("Can not find \(fileName) in main bundle")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Can not load \(url)")
        }
        guard let t = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Can not parse json data")
        }
        return t
    }
    
}
