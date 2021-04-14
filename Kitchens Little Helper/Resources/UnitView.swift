//
//  UnitView.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 25/03/2021.
//

import UIKit

class UnitView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
        
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setupView()
        
    }
    
    func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 20
        
        //setupViewConstraints()
        
    }
    
    func setupViewConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 130).isActive = true
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    

}
