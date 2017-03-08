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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calcTip(_ sender: Any) {
        
        let tipPercnt = [0.18,0.2,0.25]
        
        let bill = Double(billAmt.text!) ?? 0
        let tip = bill * tipPercnt[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format:"$%.2f",tip)
        totLabel.text = String(format:"$%.2f",total)
    }

}

