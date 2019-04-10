//
//  ViewController.swift
//  iOSTest
//
//  Created by Jese on 27/03/2019.
//  Copyright © 2019 jpitkanen. All rights reserved.
//

import UIKit
import PlainPing

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row > 0 {
        let historyIP = pickerData[row].split(separator: " ")
        ipField.text = String(historyIP[0]) as String
        } else {
        print("gah")
        }
        return pickerData[row]
    }
    
    

    @IBOutlet weak var historyBlur: UIVisualEffectView!
    @IBOutlet weak var pingHistoryButton: UIButton!
    @IBOutlet weak var pingHistory: UIPickerView!
    @IBOutlet weak var logViewBlur: UIVisualEffectView!
    @IBOutlet weak var logClose: UIButton!
    @IBOutlet weak var logVIew: UITextView!
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var pingLabel: UILabel!
    @IBOutlet weak var unknownInd: UIImageView!
    @IBOutlet weak var offlineInd: UIImageView!
    @IBOutlet weak var onlineInd: UIImageView!
    @IBOutlet weak var ipField: UITextField!
    let currentDateTime = Date()
    let formatterDate = DateFormatter()
    var pickerData: [String] = [String]()
    var historyTicker = 0
    var latencyArray: Array<Double> = []
    override func viewDidLoad() {
        super.viewDidLoad()
        offlineInd.isHidden = true
        onlineInd.isHidden = true
        pingLabel.text = "Ping the address"
        ipField.placeholder = "IP or web address"
        self.ipField.delegate = self
        pingLabel.textAlignment = NSTextAlignment.center
        buttonOutlet.setTitle("Ping", for: UIControl.State.normal)
        logVIew.text = "Logs\n"
        logVIew.isHidden = true
        logClose.isHidden = true
        logViewBlur.isHidden = true
        logViewBlur.contentView.layer.cornerRadius = 5
        logViewBlur.layer.cornerRadius = 5
        logViewBlur.layer.borderColor = UIColor.lightGray.cgColor
        logViewBlur.layer.borderWidth = 0.5
        pingHistory.isHidden = true
        historyBlur.isHidden = true
        self.pingHistory.delegate = self
        self.pingHistory.dataSource = self
        pickerData = ["No history"]
        formatterDate.timeStyle = .short
        formatterDate.dateStyle = .short
        
        var sysInfo = utsname()
        uname(&sysInfo)
        let machine = Mirror(reflecting: sysInfo.machine)
        let identifier = machine.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        NSLog("Device Type ----> %@", info().platformType(platform: identifier as NSString));
        
        print(info().platformType(platform: identifier as String as NSString))
        let devices = info().platformType(platform: identifier as NSString) as String
        let device = devices.split(separator: "/")
        deviceGlobal = String(device[0])
        if device.count > 1 {
        processor = String(device[1])
        }
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    func latencyAverage(latency: Double){
        self.latencyArray.append(latency)
        let sum = self.latencyArray.reduce(0, +)
        let average = sum / Double(latencyArray.count)
        let averageNorm = String(format: "%.2f", average)
        averageLatency = averageNorm
    }
    @IBAction func historyClose(_ sender: Any) {
        pingHistory.isHidden = true
        historyBlur.isHidden = true
    }
    @IBAction func pingHistoryAction(_ sender: Any) {
        pingHistory.isHidden = false
        historyBlur.isHidden = false
        pingHistory.reloadAllComponents()
    }
    @IBAction func logClose(_ sender: Any) {
        logVIew.isHidden = true
        logClose.isHidden = true
        logViewBlur.isHidden = true
    }
    @IBAction func logView(_ sender: Any) {
        logVIew.isHidden = false
        logClose.isHidden = false
        logViewBlur.isHidden = false
    }
    @IBAction func pingPress(_ sender: Any) {
        if ipField.text?.isEmpty == true {
            pingLabel.text = "Input an address!"
            self.unknownInd.isHidden = false
            self.onlineInd.isHidden = true
            self.offlineInd.isHidden = true
            
        } else {
          let ping = ipField.text
            PlainPing.ping(ping!, withTimeout: 1, completionBlock: {(timeElapsed:Double?, error:Error?) in
            if let latency = timeElapsed {
                let latenssi = String(format: "%.2f", latency)
                self.pingLabel.text = "Latency: \(latenssi) Status: Online"
                self.unknownInd.isHidden = true
                self.onlineInd.isHidden = false
                self.offlineInd.isHidden = true
                let latenssiSplit = latenssi.split(separator: " ")
                self.latencyAverage(latency: Double(latenssiSplit[0])!)
                print(ping!)
            }
            if let error = error {
                let logError = error.localizedDescription
                self.logVIew.text = self.logVIew.text + "\n" + logError
                self.pingLabel.text = "Not reachable, check logs"
                self.offlineInd.isHidden = false
                self.onlineInd.isHidden = true
                self.unknownInd.isHidden = true
            }
        }
        )
            if self.pickerData.contains(self.ipField.text!){
                print("Blocced")
            }
            else {
            self.pickerData.append(self.ipField.text! + " - " + self.formatterDate.string(from: self.currentDateTime))
            }
        }
    }
}
