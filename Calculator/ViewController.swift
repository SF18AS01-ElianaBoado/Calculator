//
//  ViewController.swift
//  Calculator
//
//  Created by Eliana Boado on 1/28/19.
//  Copyright © 2019 Eliana Boado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "0";
    }

    @IBAction func clearCalc(_ sender: UIButton) {
        label.text = "0";
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        var s: String = label.text!;
        s = s.replacingOccurrences(of: "−", with: "-");
        s = s.replacingOccurrences(of: "×", with: "*");
        s = s.replacingOccurrences(of: "÷", with: ".0/");   //avoid Int division
        
        //Not attempting to detect syntax errors; would require Objective-C.
        let expression: NSExpression = NSExpression(format: s);
        if let result: NSNumber = expression.expressionValue(with: nil, context: nil) as? NSNumber {
            label.text = result.stringValue;
        }
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        if label.text == "0" {
            label.text = "";
        }
        label.text! += ".";
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        if let titleLabel: UILabel = sender.titleLabel {
            if let myOperator: String = titleLabel.text {
                label.text! += myOperator;
            }
        }
    }
        @IBAction func digitPressed(_ sender: UIButton) {
        if let titleLabel: UILabel = sender.titleLabel {
            if let digit: String = titleLabel.text {
                if label.text == "0" {
                    label.text = "";
                }
                label.text! += digit;
            }
        }
    }
    
}

