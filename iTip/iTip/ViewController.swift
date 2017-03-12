//
//  ViewController.swift
//  iTip
//
//  Created by Vankayala, Prasad on 3/7/17.
//  Copyright © 2017 Prasad Vankayala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmt: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib. 

    }
    
//  Default View and getting default values stored in UserDefaults
    
    override func viewWillAppear(_ animated: Bool) {
        
        let defTip = UserDefaults.standard.array(forKey: "tip")
        
        if(defTip != nil){
            for (i,val) in (defTip?.enumerated())! {
                tipControl.setTitle("\(val)",forSegmentAt: i);
            }
        }
        calcTip(self) // Calculating the Tip & Total based on selected Tip %
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
// Calculating Tip Amount and Total Amount
    
    @IBAction func calcTip(_ sender: Any) {
        
        let currValue = tipControl.titleForSegment(at: tipControl.selectedSegmentIndex)
        let cValue=Double(String(currValue!.characters.dropLast(1)))
        
        let tipPercnt = cValue!/100
        
        let bill = Double(billAmt.text!) ?? 0
        let tip = bill * tipPercnt
        let total = bill + tip
        
        tipLabel.text = String(format:"$%.2f",tip)
        totLabel.text = String(format:"$%.2f",total)

    }

}

