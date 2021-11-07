//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "No sender")
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        print(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "No Sender")
    }
}

