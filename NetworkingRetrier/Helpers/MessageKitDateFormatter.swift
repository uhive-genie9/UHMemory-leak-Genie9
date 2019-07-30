//
//  MessageKitDateFormatter.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 4/17/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//
import Foundation

open class MessageKitDateFormatter {
    
    // MARK: - Properties
    
    public static let shared = MessageKitDateFormatter()
    
    private let formatter = DateFormatter()
    
    // MARK: - Initializer
    
    private init() {}
    
    // MARK: - Methods
    
    public func string(from date: Date) -> String {
        configureDateFormatter(for: date)
        return formatter.string(from: date)
    }
    
    public func toDate(from string: String) -> Date {
        guard let date = formatter.date(from: string) else {return Date()}
        configureDateFormatter(for: date)
        guard let dateFormatted = formatter.date(from: string) else {return Date()}
        return dateFormatted
    }
    
    
    func getFormattedLastSeen(timeStamp: Int) -> String {
        let timeInterval = Double(timeStamp)
        let lastSeen = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm a" //Specify your format that you want
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: lastSeen)
    }
    
    func formattedSentDate(timeStamp: Int) -> String {
        let timeInterval = Double(timeStamp)
        let sentDate = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: sentDate)
    }
    
    public func stringHoursOnly(from date: Date) -> String {
        configureDateFormatterToHours(for: date)
        return formatter.string(from: date)
    }
   
    
    public func attributedString(from date: Date, with attributes: [NSAttributedString.Key: Any]) -> NSAttributedString {
        let dateString = string(from: date)
        return NSAttributedString(string: dateString, attributes: attributes)
    }
    
    open func configureDateFormatter(for date: Date) {
        switch true {
        case Calendar.current.isDateInToday(date) || Calendar.current.isDateInYesterday(date):
            formatter.doesRelativeDateFormatting = true
            formatter.dateStyle = .short
            formatter.timeStyle = .short
        case Calendar.current.isDate(date, equalTo: Date(), toGranularity: .weekOfYear):
            formatter.dateFormat = "EEEE h:mm a"
        case Calendar.current.isDate(date, equalTo: Date(), toGranularity: .year):
            formatter.dateFormat = "E, d MMM, h:mm a"
        default:
            formatter.dateFormat = "MMM d, yyyy, h:mm a"
        }
    }
    open func configureDateFormatterToHours(for date: Date) {
        formatter.dateFormat = "h:mm a"
    }
    
}
