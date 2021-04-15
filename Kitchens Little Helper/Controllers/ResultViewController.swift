//
//  ResultViewController.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 07/04/2021.
//

import UIKit
import RealmSwift

class ResultViewController: UIViewController {
    
    @IBOutlet weak var equalToTextLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    
    let realm = try! Realm()
    
    var fromValue: String?
    var fromUnit: String?
    var resultValue: String?
    var resultUnit: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let value = fromValue, let unitOne = fromUnit, let unitTwo = resultUnit, let result = resultValue {
            equalToTextLabel.text = ("\(value) \(unitOne) is equal to").uppercased()
            
            resultLabel.text = result
            unitLabel.text = unitTwo.uppercased()
        }
        
        
        
        
    }
    
    @IBAction func recalculateButtonPressed(_ sender: ConvertButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveResultButtonPressed(_ sender: ConvertButton) {
        
        let newConversion = Conversion()
        
        if let value = fromValue, let unitOne = fromUnit, let unitTwo = resultUnit, let result = resultValue {
            newConversion.image = "none" //For now
            newConversion.fromValue = value
            newConversion.fromUnit = unitOne
            newConversion.toUnit = unitTwo
            newConversion.result = result
        }
        
        save(conversion: newConversion)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func save(conversion: Conversion) {
        do {
            try realm.write {
                realm.add(conversion)
            }
        } catch {
            print("Error! Could not save data to Realm \(error)")
        }
    }
    
    
}
