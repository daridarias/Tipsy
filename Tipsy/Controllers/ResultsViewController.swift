//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Дарья Сотникова on 19.08.2023.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel?
    @IBOutlet weak var settingsLabel: UILabel?
    
    var result = 0.0
    var tip = 0
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel?.text = String(result)
        settingsLabel?.text = "Split between \(split) people, with \(tip)% tip."
}

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
