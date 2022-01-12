//
//  Battery.swift
//  Juice
//
//  Created by Matthew Guo on 1/11/22.
//

import Foundation
import IOKit.ps

struct Battery {
    var powerSource = "unknown"
    var timeToEmpty = 0
    
    func getTimeRemaining() -> String {
        switch self.powerSource {
        case "ac":
            return "🧃"
        default:
            if self.timeToEmpty < 0 {
                return "🤔"
            }
            let hours = String(self.timeToEmpty / 60)
            let min = self.timeToEmpty % 60
            // some jank left pad
            let minutes = min < 10 ? "0\(min)" : String(min)
            return "\(hours):\(minutes)"
        }
    }
    
    init() {
        guard
            let blob = IOPSCopyPowerSourcesInfo(),
            let list = IOPSCopyPowerSourcesList(blob.takeRetainedValue()),
            let array = list.takeRetainedValue() as? [Any],
            array.count > 0,
            let dict = array[0] as? NSDictionary
        else {
            return
        }
        
        timeToEmpty = dict[kIOPSTimeToEmptyKey] as? Int ?? 0
        
        if let value = dict[kIOPSPowerSourceStateKey] as? String {
            switch value {
            case kIOPSACPowerValue:
                powerSource = "ac"
            case kIOPSBatteryPowerValue:
                powerSource = "battery"
            default:
                powerSource = "unknown"
            }
        }
    }
}
