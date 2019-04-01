//
//  info.swift
//  iPinger
//
//  Created by Jese on 01/04/2019.
//  Copyright © 2019 jpitkanen. All rights reserved.
//

import Foundation

public class info {
    public func platformType(platform : NSString) -> NSString{
        if platform.isEqual(to: "iPhone1,1")  {
            return "iPhone 1G"
        }
        else if platform.isEqual(to: "iPhone1,2"){
            return "iPhone 3G"
        }
        else if platform.isEqual(to: "iPhone2,1"){
            return "iPhone 3GS"
        }
        else if platform.isEqual(to: "iPhone3,1"){
            return "iPhone 4/Apple A4"
        }
        else if platform.isEqual(to: "iPhone3,3"){
            return "Verizon iPhone 4/Apple A4"
        }
        else if platform.isEqual(to: "iPhone4,1"){
            return "iPhone 4S/Apple A5"
        }
        else if platform.isEqual(to: "iPhone5,1"){
            return "iPhone 5 (GSM)/Apple A6"
        }
        else if platform.isEqual(to: "iPhone5,2"){
            return "iPhone 5 (GSM+CDMA)/Apple A6"
        }
        else if platform.isEqual(to: "iPhone5,3"){
            return "iPhone 5c (GSM)/Apple A6"
        }
        else if platform.isEqual(to: "iPhone5,4"){
            return "iPhone 5c (GSM+CDMA)/Apple A6"
        }
        else if platform.isEqual(to: "iPhone6,1"){
            return "iPhone 5s (GSM)/Apple A7"
        }
        else if platform.isEqual(to: "iPhone6,2"){
            return "iPhone 5s (GSM+CDMA)/Apple A7"
        }
        else if platform.isEqual(to: "iPhone7,2"){
            return "iPhone 6/Apple A8"
        }
        else if platform.isEqual(to: "iPhone7,1"){
            return "iPhone 6 Plus/Apple A8"
        }
        else if platform.isEqual(to: "iPhone8,1"){
            return "iPhone 6s/Apple A9"
        }
        else if platform.isEqual(to: "iPhone8,2"){
            return "iPhone 6s Plus/Apple A9"
        }
        else if platform.isEqual(to: "iPhone8,4"){
            return "iPhone SE/Apple A9"
        }
        else if platform.isEqual(to: "iPhone9,1"){
            return "iPhone 7/Apple A10 Fusion"
        }
        else if platform.isEqual(to: "iPhone9,2"){
            return "iPhone 7 Plus/Apple A10 Fusion"
        }
        else if platform.isEqual(to: "iPhone9,3"){
            return "iPhone 7/Apple A10 Fusion"
        }
        else if platform.isEqual(to: "iPhone9,4"){
            return "iPhone 7 Plus/Apple A10 Fusion"
        }
        else if platform.isEqual(to: "iPod1,1"){
            return "iPod Touch 1G"
        }
        else if platform.isEqual(to: "iPod2,1"){
            return "iPod Touch 2G"
        }
        else if platform.isEqual(to: "iPod3,1"){
            return "iPod Touch 3G"
        }
        else if platform.isEqual(to: "iPod4,1"){
            return "iPod Touch 4G"
        }
        else if platform.isEqual(to: "iPod5,1"){
            return "iPod Touch 5G"
        }
        else if platform.isEqual(to: "iPad1,1"){
            return "iPad"
        }
        else if platform.isEqual(to: "iPad2,1"){
            return "iPad 2 (WiFi)"
        }
        else if platform.isEqual(to: "iPad2,2"){
            return "iPad 2 (GSM)"
        }
        else if platform.isEqual(to: "iPad2,3"){
            return "iPad 2 (CDMA)"
        }
        else if platform.isEqual(to: "iPad2,4"){
            return "iPad 2 (WiFi)"
        }
        else if platform.isEqual(to: "iPad2,5"){
            return "iPad Mini (WiFi)"
        }
        else if platform.isEqual(to: "iPad2,6"){
            return "iPad Mini (GSM)"
        }
        else if platform.isEqual(to: "iPad2,7"){
            return "iPad Mini (GSM+CDMA)"
        }
        else if platform.isEqual(to: "iPad3,1"){
            return "iPad 3 (WiFi)"
        }
        else if platform.isEqual(to: "iPad3,2"){
            return "iPad 3 (GSM+CDMA)"
        }
        else if platform.isEqual(to: "iPad3,3"){
            return "iPad 3 (GSM)"
        }
        else if platform.isEqual(to: "iPad3,4"){
            return "iPad 4 (WiFi)"
        }
        else if platform.isEqual(to: "iPad3,5"){
            return "iPad 4 (GSM)"
        }
        else if platform.isEqual(to: "iPad3,6"){
            return "iPad 4 (GSM+CDMA)"
        }
        else if platform.isEqual(to: "iPad4,1"){
            return "iPad Air (WiFi)"
        }
        else if platform.isEqual(to: "iPad4,2"){
            return "iPad Air (Cellular)"
        }
        else if platform.isEqual(to: "iPad4,3"){
            return "iPad Air"
        }
        else if platform.isEqual(to: "iPad4,4"){
            return "iPad Mini 2G (WiFi)"
        }
        else if platform.isEqual(to: "iPad4,5"){
            return "iPad Mini 2G (Cellular)"
        }
        else if platform.isEqual(to: "iPad4,6"){
            return "iPad Mini 2G";
        }
        else if platform.isEqual(to: "iPad4,7"){
            return "iPad Mini 3 (WiFi)"
        }
        else if platform.isEqual(to: "iPad4,8"){
            return "iPad Mini 3 (Cellular)"
        }
        else if platform.isEqual(to: "iPad4,9"){
            return "iPad Mini 3 (China)"
        }
        else if platform.isEqual(to: "iPad5,3"){
            return "iPad Air 2 (WiFi)"
        }
        else if platform.isEqual(to: "iPad5,4"){
            return "iPad Air 2 (Cellular)"
        }
        else if platform.isEqual(to: "AppleTV2,1"){
            return "Apple TV 2G"
        }
        else if platform.isEqual(to: "AppleTV3,1"){
            return "Apple TV 3"
        }
        else if platform.isEqual(to: "AppleTV3,2"){
            return "Apple TV 3 (2013)"
        }
        else if platform.isEqual(to: "i386"){
            return "Simulator"
        }
        else if platform.isEqual(to: "x86_64"){
            return "Simulator"
        }
        return platform
    }
}
