//
//  DryIngredientsViewController.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 16/03/2021.
//

import UIKit


class DryIngredientsViewController: UIViewController {

    @IBOutlet weak var pickerViewOne: UIPickerView!
    var rotationAngle: CGFloat!
    
    
    var data = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rotationAngle = 90 * (.pi / 180)
        var originY = pickerViewOne.frame.origin.y
        pickerViewOne?.transform = CGAffineTransform(rotationAngle: rotationAngle)
        
        
        pickerViewOne.frame = CGRect(x: -100, y: originY, width: view.frame.width + 200, height: 60)
        
        pickerViewOne?.dataSource = self
        pickerViewOne?.delegate = self
        
 
    }
    

}

extension DryIngredientsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
}



    
    
    
    
    
    

