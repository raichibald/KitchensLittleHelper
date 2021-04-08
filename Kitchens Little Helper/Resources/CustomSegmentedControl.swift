//
//  CustomSegmentedControl.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 22/03/2021.
//

import UIKit

@IBDesignable
class CustomSegmentedControl: UIControl {
    
    var segmentButtons = [UIButton]()
    var selector: UIView!
    var selectedSegmentIndex = 0
    
    
    //Background
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            //When it is set, change border width of view
            layer.borderWidth = borderWidth
        }
    }
    
    //Background border color
    @IBInspectable
    var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    //Button images/titles
    @IBInspectable
    var commaSeparatedButtonImageNames: String = "" {
        didSet {
            updateView()
        }
    }
    
    //Button color
    @IBInspectable
    var buttonImageColor: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    //Selector color
    @IBInspectable
    var selectorColor: UIColor = .white {
        didSet {
            updateView()
        }
    }
    
    //Selector image tint color
    @IBInspectable
    var selectorImageTintColor: UIColor = .systemRed {
        didSet {
            updateView()
        }
    }
    
    //Button highlight
//    @IBInspectable
//    var buttonHighlighted: Bool = false {
//        didSet {
//            updateView()
//        }
//    }
    
    
    
    func updateView() {
        //Instead of writting segmentButtons = []
        segmentButtons.removeAll()
        
        //Clearing out the subviews (stackview), otherwise stackviews will get stacked
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        let buttonImageNames = commaSeparatedButtonImageNames.components(separatedBy: ",")
        
        for imageName in buttonImageNames {
            let button = UIButton(type: .system)
            button.setImage(UIImage(named: imageName), for: .normal)
            button.tintColor = buttonImageColor
            //Calling function everytime button is clicked
            button.addTarget(self, action: #selector(segmentButtonTapped(button:)), for: .touchUpInside)
            //button.adjustsImageWhenHighlighted = buttonHighlighted
            segmentButtons.append(button)
        }
        
        //Default selected button
        segmentButtons[0].tintColor = selectorImageTintColor
        
        //Selector
        let selectorWidth = frame.width / CGFloat(buttonImageNames.count)
        
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.layer.cornerRadius = frame.height / 2
        selector.backgroundColor = selectorColor
        addSubview(selector)
        
        //Adding Stack View
        let stackView = UIStackView(arrangedSubviews: segmentButtons)
        
        //Configuring the stack view
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        
        //Adding stack view to UIView
        addSubview(stackView)
        
        //Sizing the stack view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //Setting stack view topAnchor equal to UIView (parent view) topAnchor
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

    override func draw(_ rect: CGRect) {
        // Drawing code on storyboard or when application is run
        
        //Changing corner radius
        layer.cornerRadius = frame.height / 2
        
    }
    
    @objc func segmentButtonTapped(button: UIButton) {
        print("Gets called")
        for (buttonIndex, btn) in segmentButtons.enumerated() {
            btn.tintColor = buttonImageColor
            
            if btn == button {
                //Sending selected segment index
                selectedSegmentIndex = buttonIndex
                
                //Sliding animation
                let selectorStartPosition = frame.width / CGFloat(segmentButtons.count) * CGFloat(buttonIndex)
                
                UIView.animate(withDuration: 0.3) {
                    self.selector.frame.origin.x = selectorStartPosition
                }
                
                btn.tintColor = selectorImageTintColor
            }
        }
        
        //Sending actions
        sendActions(for: .valueChanged)
        
    }
    
    
    

}

//extension UIButton {
//    open override var isHighlighted: Bool {
//        didSet {
//            super.isHighlighted = false
//        }
//    }
//}
