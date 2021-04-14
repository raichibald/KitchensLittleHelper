//
//  SwitchButton.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 26/03/2021.
//

import UIKit

class SwitchButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSwitchButton()
        
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setupSwitchButton()
        
    }
    
    
    
    func setupSwitchButton() {
        setImage(UIImage(named: "switch"), for: .normal)
        //setTitle("SWITCH", for: .normal)
        backgroundColor = UIColor(named: "warmRed")
        //layer.cornerRadius = 50
    }

}
