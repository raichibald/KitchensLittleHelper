//
//  UIViewController.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 01/04/2021.
//

import UIKit

extension UIViewController {
    
    func dismissKeyboardWhenTappedOutside() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
}
