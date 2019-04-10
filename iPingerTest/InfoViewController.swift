//
//  InfoViewController.swift
//  iPinger
//
//  Created by Jese on 01/04/2019.
//  Copyright © 2019 jpitkanen. All rights reserved.
//

import UIKit
import Foundation
import CoreTelephony
import SystemConfiguration
import Reachability

class InfoViewController: UIViewController {

    @IBOutlet weak var infoField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String {
            print(countryCode)
            region = countryCode
        }
        let reachability = Reachability()
        connection = (reachability?.connection.description) ?? "No internet"
        if connection != "WiFi" {
            infoField.text = "\n\n\nDevice: \(deviceGlobal)\nProcessor: \(processor)\nConnection: \(connection)\nLocal IP: Null\nRouter IP: Null\nRegion: \(region)\nAverage latency: \(averageLatency)"
        }
        else {
            let localIP = getIPAddress()
            localAddress = localIP!
            var routerIP = localIP?.split(separator: ".")
            let routerIPTrue = (routerIP?.count)! - 1
            routerIP![routerIPTrue] = "1"
            routerAddress = (routerIP?.joined(separator: "."))!
            infoField.text = "\n\n\nDevice: \(deviceGlobal)\nProcessor: \(processor)\nConnection: \(connection)\nLocal IP: \(localAddress)\nRouter IP: \(routerAddress)\nRegion: \(region)\nAverage latency: \(averageLatency)"
        }
    }
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func getIPAddress() -> String? {
        var address: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }
                
                let interface = ptr?.pointee
                let addrFamily = interface?.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                    
                    if let name: String = String(cString: (interface?.ifa_name)!), name == "en0" {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        getnameinfo(interface?.ifa_addr, socklen_t((interface?.ifa_addr.pointee.sa_len)!), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                        address = String(cString: hostname)
                    }
                }
            }
            freeifaddrs(ifaddr)
        }
        return address

}
    
}
    var deviceGlobal = ""
    var connection = ""
    var memory = ""
    var processor = "Apple A9"
    var cores = ""
    var speed = ""
    var averageLatency = ""
    var region = ""
    var localAddress = ""
    var routerAddress = ""
