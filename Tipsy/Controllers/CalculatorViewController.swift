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
    @IBOutlet weak var paxStepper: UIStepper!
    
    var appModel = App()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    @IBAction func ammountChanged(_ sender: UITextField) {
        let ammount = Float(sender.text!) ?? 0
        appModel.setAmmount(ammount: ammount)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        disableTipButtons(active:sender)
        let percentage = getPercentageAsFloatFromString(s:sender.titleLabel?.text ?? "0%")
        appModel.setPercentageTip(percentegeTip: percentage)
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let pax = Int(sender.value)
        appModel.setPax(pax: pax)
        splitNumberLabel.text = String(pax)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "No Sender")
        appModel.debug()
        performSegue(withIdentifier: "showResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if(segue.identifier == "showResults"){
                let destinationVC = segue.destination as! ResultsViewController
                destinationVC.appModel = appModel
            }
        }
    
    func initialize(){
        appModel = App()
        
        disableTipButtons(active: nil)
        splitNumberLabel.text = String(appModel.pax)
        paxStepper.value = Double(appModel.pax)
        billTextField.text = ""
        appModel.debug()
    }
    
    func disableTipButtons(active:UIButton?){
        zeroPcButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if(active != nil){
            active!.isSelected = true
        }
    }
    
    func getPercentageAsFloatFromString(s:String) -> Float{
        var output:Float = 0.0
        
        if s == "10%" {
            output = 0.1
        }
        
        if s == "20%" {
            output = 0.2
        }
        
        return output
    }
    
    
}

