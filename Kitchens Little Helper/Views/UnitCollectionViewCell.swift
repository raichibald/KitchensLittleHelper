//
//  UnitCollectionViewCell.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 25/03/2021.
//

import UIKit

class UnitCollectionViewCell: UICollectionViewCell {
    
    let cornerRadius: CGFloat = 27
    var bigLabel =  UILabel()
    //var bigLabel: UILabel! = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool{
        willSet{
            super.isSelected = newValue
            //self.layer.borderColor = newValue ?  UIColor.black.cgColor : #colorLiteral(red: 0.6862131953, green: 0.686313808, blue: 0.6861912012, alpha: 1)
            //self.bigLabel.textColor = newValue ? UIColor.black : #colorLiteral(red: 0.6862131953, green: 0.686313808, blue: 0.6861912012, alpha: 1)
            self.backgroundColor = newValue ? UIColor(named: "warmRed") : UIColor(named: "warmRed")?.withAlphaComponent(0.4)
        }
    }
    
//    override var isSelected: Bool {
//        didSet {
//            self.contentView.layer.cornerRadius = cornerRadius
////            bigLabel = UILabel()
////    //        bigLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
////            bigLabel.text = "oz"
////            bigLabel.font = .boldSystemFont(ofSize: 30)
////            bigLabel.textColor = UIColor(named: "darkWhite")
////    //        bigLabel.font = UIFont(name: "Avenir Black", size: 30)
////    //        bigLabel.font = UIFont(name: "Helvetica Neue Bold", size: 30)
////    //        bigLabel.font = UIFont(name: "SignPainter", size: 30)
////
////            bigLabel.textAlignment = .left
////            bigLabel.translatesAutoresizingMaskIntoConstraints = false
////            addSubview(bigLabel)
////            setBigLabelConstraints()
//////            if isSelected {
//////                self.contentView.backgroundColor = UIColor(named: "warmRed")
//////            } else {
//////                self.contentView.backgroundColor = .none
//////            }
////
////            self.contentView.backgroundColor = isSelected ? UIColor(named: "warmRed") : .none
//            selectedBackgroundView?.backgroundColor = isSelected ? UIColor(named: "warmRed") : .none
//            
//        }
//    }
    
    func setupView() {
        backgroundColor = UIColor(named: "warmRed")?.withAlphaComponent(0.4)
        layer.cornerRadius = cornerRadius
        
        configureUnitViewLabels()
    }
    
    
    
    func configureUnitViewLabels() {
        //bigLabel = UILabel()
//        bigLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        //bigLabel.text = ""
        bigLabel.font = .boldSystemFont(ofSize: 30)
        bigLabel.textColor = UIColor(named: "darkWhite")
//        bigLabel.font = UIFont(name: "Avenir Black", size: 30)
//        bigLabel.font = UIFont(name: "Helvetica Neue Bold", size: 30)
//        bigLabel.font = UIFont(name: "SignPainter", size: 30)

        bigLabel.textAlignment = .left
        bigLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bigLabel)

        setBigLabelConstraints()
    }

    func setBigLabelConstraints() {
        bigLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        bigLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        bigLabel.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: 5).isActive = true
        bigLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    
}
