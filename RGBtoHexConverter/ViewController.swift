//
//  ViewController.swift
//  RGBtoHexConverter
//
//  Created by aytug on 3.04.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var choseColorLabel: UILabel!
    @IBOutlet weak var choseColorView: UIView!
    @IBOutlet weak var convertButton: UIButton!
    var selectedSegmentIndex = 0 {
        didSet {
            clearFields()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertButton.layer.cornerRadius = convertButton.bounds.height / 2
   
    }
    
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        selectedSegmentIndex = sender.selectedSegmentIndex
    }
    
    @IBAction func convertTapped(_ sender: UIButton) {
        if selectedSegmentIndex == 0 {
            convertRGBtoHEX()
        } else {
            convertHEXtoRGB()
        }
    }
    
    func convertRGBtoHEX() {
        guard let redValue = redTextField.text?.rgbToHex else {
            makeAlert(title: "Error", message: "Red value is could be between 0 to 255")
            return
            
        }
        guard let greenValue = greenTextField.text?.rgbToHex else {
            makeAlert(title: "Error", message: "Green value is could be between 0 to 255")
            return
            
        }
        guard let blueValue = blueTextField.text?.rgbToHex else {
            makeAlert(title: "Error", message: "Blue value is could be between 0 to 255")
            return
            
        }

        resultLabel.text = "HEX Color: #\(redValue)\(greenValue)\(blueValue)"
        choseColorView.backgroundColor = UIColor(red: CGFloat(Int(redTextField.text!)!)/255, green: CGFloat(Int(greenTextField.text!)!)/255, blue: CGFloat(Int(blueTextField.text!)!)/255, alpha: 1)
        
         
    }
    
    func convertHEXtoRGB() {
        guard let redValue = redTextField.text?.hexToRgb else {
            makeAlert(title: "Error", message: "Red value is could be hexadecimal format")
            return }
        guard let greenValue = greenTextField.text?.hexToRgb else {
            makeAlert(title: "Error", message: "Green value is could be hexadecimal format")
            return
            
        }
        guard let blueValue = blueTextField.text?.hexToRgb else {
            makeAlert(title: "Error", message: "Blue value is could be hexadecimal format")
            return
            
        }
        
        
        resultLabel.text = "Red: \(redValue)\nGreen: \(greenValue)\nBlue: \(blueValue)"
        choseColorView.backgroundColor = UIColor(red: CGFloat(Int(redValue)!)/255, green: CGFloat(Int(greenValue)!)/255, blue: CGFloat(Int(blueValue)!)/255, alpha: 1)
        
    }
    
    func clearFields() {
        redTextField.text?.removeAll()
        greenTextField.text?.removeAll()
        blueTextField.text?.removeAll()
        resultLabel.text?.removeAll()
        choseColorView.backgroundColor = .white
    }
    
  
}



