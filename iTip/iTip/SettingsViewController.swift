//
//  SettingsViewController.swift
//  iTip
//
//  Created by Vankayala, Prasad on 3/7/17.
//  Copyright © 2017 Prasad Vankayala. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defTipControl: UISegmentedControl!
    
    @IBOutlet weak var stepControl: UIStepper!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var cValue = 0.0
    var step = 0.0
    var selSegment=0
    var currValue:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let defaults = UserDefaults.standard
        if let Tip = defaults.string(forKey:"lTip") {
            defTipControl.setTitle(Tip, forSegmentAt: 0)
        }
        if let Tip = defaults.string(forKey:"mTip") {
            defTipControl.setTitle(Tip, forSegmentAt: 1)
        }
        if let Tip = defaults.string(forKey:"hTip") {
            defTipControl.setTitle(Tip, forSegmentAt: 2)
        }
        
        step = stepControl.value
        selSegment = defTipControl.selectedSegmentIndex
        currValue = defTipControl.titleForSegment(at: selSegment)!
        cValue=Double(String(currValue.characters.dropLast(1)))!
        stepControl.value=cValue
        
        // Do any additional setup after loading the view.
        
        saveButton.isHidden=true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        selSegment = defTipControl.selectedSegmentIndex
        currValue = defTipControl.titleForSegment(at: selSegment)!
        cValue=Double(String(currValue.characters.dropLast(1)))!
        stepControl.value=cValue
    }
    
    @IBAction func changeValues(_ sender: Any) {
        step = stepControl.value
        let dValue = String(format:"%.0f",step)
        
        defTipControl.setTitle(dValue+"%", forSegmentAt: defTipControl.selectedSegmentIndex)
        
        saveButton.isHidden=false
        
    }
    
    @IBAction func saveTipPercnt(_ sender: Any) {
        
        let loTip = defTipControl.titleForSegment(at: 0)
        let medTip = defTipControl.titleForSegment(at: 1)
        let hiTip = defTipControl.titleForSegment(at: 2)
        
        let defaults = UserDefaults.standard
        defaults.set(loTip, forKey: "lTip")
        defaults.set(medTip, forKey: "mTip")
        defaults.set(hiTip, forKey: "hTip")
        defaults.synchronize()
        
        saveButton.isHidden=true
                
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     @IBAction func restoreDefaults(_ sender: Any) {
     }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func restoreDef(_ sender: Any) {
        defTipControl.setTitle("18%", forSegmentAt: 0)
        defTipControl.setTitle("20%", forSegmentAt: 1)
        defTipControl.setTitle("25%", forSegmentAt: 2)
        defTipControl.selectedSegmentIndex=0
    }

}
