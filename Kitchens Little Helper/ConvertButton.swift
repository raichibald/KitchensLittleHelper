//
//  ConvertButton.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 26/03/2021.
//

import UIKit

@IBDesignable
class ConvertButton: UIButton {
    
    @IBInspectable
    var buttonTitle: String = "BUTTON" {
        didSet {
            setTitle(buttonTitle, for: .normal)
        }
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConvertButton()
        
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setupConvertButton()
        
    }
    
    
    
    func setupConvertButton() {
//        setTitle("CONVERT", for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 17)
        setTitleColor(UIColor(named: "warmRed"), for: .normal)
        //titleLabel?.tintColor = .blue//UIColor(named: "warmRed")!
        backgroundColor = UIColor(named: "darkWhite")
        layer.cornerRadius = 25
        layer.borderWidth = 2
        layer.borderColor = UIColor(named: "warmRed")?.cgColor
        
    }

}

