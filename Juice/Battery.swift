//
//  Battery.swift
//  Juice
//
//  Created by Matthew Guo on 1/11/22.
//

import Foundation

struct Battery {
    static func getTimeRemaining() -> String {
        let time = IOPSGetTimeRemainingEstimate()
        if time < 0 {
            return time == -2.0 ? "🧃" : "🤔"
        }
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .positional
        let formattedString = formatter.string(from: TimeInterval(time))!
        return formattedString
    }
}
