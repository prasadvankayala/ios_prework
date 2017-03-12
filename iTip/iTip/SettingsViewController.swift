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
    
    var cValue : Double = 0.0
    var step : Double = 0.0
    var selSegment : Int = 0
    var currValue: String = ""

//  get Selected Tip Value from the Segmented control
    func getSelectedTipValue()
    {
        selSegment = defTipControl.selectedSegmentIndex
        currValue = defTipControl.titleForSegment(at: selSegment)!
        cValue=Double(String(currValue.characters.dropLast(1)))!
        stepControl.value=cValue // initializing the step control to selected segment value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defTip = UserDefaults.standard.array(forKey: "tip")
        if(defTip != nil){
            for (i,val) in (defTip?.enumerated())! {
                defTipControl.setTitle("\(val)",forSegmentAt: i);
            }
        }
        step = stepControl.value // reading the current step value
        
        getSelectedTipValue() // get selected tip value
        
        saveButton.isHidden=true // hiding the save button till Tip % are changed
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentChanged(_ sender: Any) {
        getSelectedTipValue()
    }
    
//  Changing the Selected Segment value with the step control change
    @IBAction func changeValues(_ sender: Any) {
        step = stepControl.value // current step control value
        let dValue = String(format:"%.0f",step) // converting to string
        
        defTipControl.setTitle(dValue+"%", forSegmentAt: defTipControl.selectedSegmentIndex) // updating the selected tip control with step value
        
        saveButton.isHidden=false // showing the Save button
    }
    
    @IBAction func saveTipPercnt(_ sender: Any) {
        
        var tipValues = [String]()
        for i in 0...2 {
            tipValues.insert(defTipControl.titleForSegment(at: i)!, at: i)
        }
        // Storing the changed Tip % as default values
        let defaults = UserDefaults.standard
        defaults.set(tipValues, forKey: "tip")
        defaults.synchronize()
        
        saveButton.isHidden=true // Hiding the Save button after saving the default values
                
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
    
    // Restore Default Tip Percentages
    @IBAction func restoreDef(_ sender: Any) {
        
        let defArray = ["18%","20%","25%"]
        
        for (i,val) in defArray.enumerated() {
            defTipControl.setTitle(val, forSegmentAt: i)
        }
        
        defTipControl.selectedSegmentIndex=0
    }

}
