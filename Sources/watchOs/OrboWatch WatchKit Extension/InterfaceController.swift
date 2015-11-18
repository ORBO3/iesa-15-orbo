//
//  InterfaceController.swift
//  OrboWatch WatchKit Extension
//
//  Created by Shyam SABAPATHI on 18/11/2015.
//  Copyright © 2015 ORBO. All rights reserved.
//

import WatchKit
import Foundation

enum modes{
    case NOT_SET
    case ADDITION
    case SUBSTRACTION
}

class InterfaceController: WKInterfaceController {

    var labelString:String = "0"
    var currentMode:modes = modes.NOT_SET
    var savedNum:Int64 = 0
    var lastButtonWasMode:Bool = false

    @IBOutlet var label: WKInterfaceLabel!
    
    @IBAction func tapped7() {
        tappedShift(7)
    }
    
    @IBAction func tapped8() {
        tappedShift(8)
    }
    
    @IBAction func tapped9() {
        tappedShift(9)
    }
    
    @IBAction func tapped4() {
        tappedShift(4)
    }
    
    @IBAction func tapped5() {
        tappedShift(5)
    }
    
    @IBAction func tapped6() {
        tappedShift(6)
    }
    
    @IBAction func tapped1() {
        tappedShift(1)
    }
    
    @IBAction func tapped2() {
        tappedShift(2)
    }
    
    @IBAction func tapped3() {
        tappedShift(3)
    }
    
    @IBAction func tapped0() {
        tappedShift(0)
    }
    
    func tappedShift(num:Int) {
        if(lastButtonWasMode){
            lastButtonWasMode = false
            labelString = "0"
        }
        labelString = labelString.stringByAppendingString("\(num)")
        updateText()
    }
    
    func updateText() {
        guard let labelInt:Int64 = Int64(labelString) else{
            label.setText("number is too large")
            return
        }
        label.setText("\(labelInt)")
    }
    
    @IBAction func tappedPlus() {
        changeMode(modes.ADDITION)
    }
    
    @IBAction func tappedMinus() {
        changeMode(modes.SUBSTRACTION)
    }
    
    func changeMode(newMode:modes){
        if savedNum == 0{
            return
        }
        currentMode = newMode
        lastButtonWasMode = true
    }
    
    @IBAction func tappedClear() {
        savedNum = 0
        labelString = "0"
        label.setText("0")
        currentMode = modes.NOT_SET
        lastButtonWasMode = false
    }
    
    @IBAction func tappedEquals() {
    }

    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
