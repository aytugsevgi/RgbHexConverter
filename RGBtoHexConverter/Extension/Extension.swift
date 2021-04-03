//
//  StringExtension.swift
//  RGBtoHexConverter
//
//  Created by aytug on 3.04.2021.
//

import Foundation
import UIKit

extension String {
    var rgbToHex: String? {
        guard let hexValue =  UInt8(self) else { return nil }
        var hex = String(format: "%2X", hexValue)
        hex = hex.replacingOccurrences(of: " ", with: "0")
        return hex
    }
    var hexToRgb: String? {
        guard let rgbValue = UInt8(self, radix: 16) else { return nil }
        return String(rgbValue)
    }
}

extension ViewController {
    func makeAlert(title: String, message: String){
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertView.addAction(action)
        present(alertView, animated: true)
    }
}
