//
//  ViewController.swift
//  Tipsy
//
//  Created by Bola Gadalla on 14/01/20.
//  Copyright © 2020 Bola Gadalla. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController
{
    
    @IBOutlet weak var amountLabel: UITextField!
    @IBOutlet weak var zeroPctLabel: UIButton!
    @IBOutlet weak var tenPctLabel: UIButton!
    @IBOutlet weak var twentyPctLabel: UIButton!
    @IBOutlet weak var splitAmountLabel: UILabel!
    
    var percentage: Float = 0.1
    var splitAmount: Int = 2
    var billAmount: Float = 0.00
    var tipTotalAmount: Float = 0.00
    
    @IBAction func TipChange(_ sender: UIButton)
    {
        let selectedButton = sender.currentTitle!
        switch selectedButton
        {
        case "0%":
            zeroPctLabel.isSelected = true
            tenPctLabel.isSelected = false
            twentyPctLabel.isSelected = false
            percentage = 0.0
        case "10%":
            zeroPctLabel.isSelected = false
            tenPctLabel.isSelected = true
            twentyPctLabel.isSelected = false
            percentage = 0.10
        default:
            zeroPctLabel.isSelected = false
            tenPctLabel.isSelected = false
            twentyPctLabel.isSelected = true
            percentage = 0.20
        }
    }
    
    @IBAction func StepperChanger(_ sender: UIStepper)
    {
        splitAmount = Int(sender.value)
        splitAmountLabel.text = String(splitAmount)
    }
    
    
    @IBAction func CalculateButton(_ sender: UIButton)
    {
        billAmount = Float(amountLabel.text!)!
        tipTotalAmount = (billAmount) * percentage / Float(splitAmount)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "goToResult"
        {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = String(format: "%.2f", tipTotalAmount)
            destinationVC.extraText = "Split between \(splitAmount) people, with \(percentage * 100)% tip."
        }
    }
}

