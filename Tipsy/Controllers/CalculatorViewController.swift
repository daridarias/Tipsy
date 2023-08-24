//
//  ViewController.swift
//  Tipsy
//
//  Created by Дарья Сотникова on 16.08.2023.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField?
    @IBOutlet weak var zeroPctButton: UIButton?
    @IBOutlet weak var tenPctButton: UIButton?
    @IBOutlet weak var twentyPctButton: UIButton?
    @IBOutlet weak var splitNumberLabel: UILabel?

    var tipPercent = 10.0
    var numberOfPeople = 2
    var totalResult: Double = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton?.isSelected = false
        tenPctButton?.isSelected = false
        twentyPctButton?.isSelected = false
        sender.isSelected = true
        
        tipPercent = Double(sender.title(for: .selected)?.dropLast(1) ?? "") ?? 1
        billTextField?.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel?.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if tipPercent != 0 {
            let result = (Double(billTextField?.text ?? "") ?? 1) * tipPercent / 100
            totalResult = result / Double(numberOfPeople)
        } else {
            totalResult = 0.00
        }
        self.performSegue(withIdentifier: "showResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier  == "showResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.result = totalResult
            destinationVC.tip = Int(tipPercent)
            destinationVC.split = numberOfPeople
        }
    }
}

