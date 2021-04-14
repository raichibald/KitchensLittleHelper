//
//  ResultViewController.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 07/04/2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var equalToTextLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var unitLabel: UILabel!
    
    var fromValue: String?
    var fromUnit: String?
    var resultValue: String?
    var resultUnit: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = resultValue
        
        if let value = fromValue, let unitOne = fromUnit, let unitTwo = resultUnit {
            equalToTextLabel.text = ("\(value) \(unitOne) is equal to").uppercased()
            unitLabel.text = unitTwo.uppercased()
        }
        
        
        
        
    }
    
    @IBAction func recalculateButtonPressed(_ sender: ConvertButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveResultButtonPressed(_ sender: ConvertButton) {
    }
    
    
}
