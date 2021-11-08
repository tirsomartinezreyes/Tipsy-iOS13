//
//  App.swift
//  Tipsy
//
//  Created by Tirso Martínez on 07/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

struct App {
    var percentageTip:Float = 0.0
    var pax:Int = 2
    var ammount:Float = 0.0
    
    func debug(){
        print("- - - - - - - - - - - - - - - - - - - \n")
        print("ammount:\(ammount)")
        print("pax:\(pax)")
        print("percentageTip:\(percentageTip)")
        print("Tip per pax:\(getAmmountPerPaxAsString())")
        print("Settigns:\(getSettingsAsString())")
        
    }
    
    mutating func setPercentageTip(percentegeTip:Float){
        self.percentageTip = percentegeTip
    }
    
    mutating func setPax(pax:Int){
        self.pax = pax
    }
    
    mutating func setAmmount(ammount:Float){
        self.ammount = ammount
    }
    
    func getAmmountPerPaxAsString()->String{
        return String(format:"%.2f",(ammount * (1.0+percentageTip))/Float(pax))
    }
    
    func getSettingsAsString()->String{
        return String("Split between \(String(pax)) people with \(String(format:"%.0f",(percentageTip * 100.0)))% tip")
    }
}
