//
//  SavedConversionsViewController.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 14/04/2021.
//

import UIKit

class SavedConversionsViewController: UIViewController {
    
    
    @IBOutlet weak var savedConversionsTableView: UITableView!
    
    var data = ["A", "B", "C"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        savedConversionsTableView.dataSource = self
        
        savedConversionsTableView.register(UINib(nibName: "ConversionCell", bundle: nil), forCellReuseIdentifier: "reusableConversionCell")

    }
    
}

extension SavedConversionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableConversionCell", for: indexPath) as! ConversionCell
        
        cell.fromLabel.text = data[indexPath.row]
        
        
        return cell
    }
    
    
}

