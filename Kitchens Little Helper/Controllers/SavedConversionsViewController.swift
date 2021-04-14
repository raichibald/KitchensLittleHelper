//
//  SavedConversionsViewController.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 14/04/2021.
//

import UIKit

class SavedConversionsViewController: UIViewController {
    
    
    @IBOutlet weak var savedConversionsTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        
//        savedConversionsTableView.register(UINib(nibName: "ConversionCell"), bundle: nil, forCellReuseIdentifier: "ConversionCell")
    }


}



