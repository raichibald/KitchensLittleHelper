//
//  SavedConversionsViewController.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 14/04/2021.
//

import UIKit
import RealmSwift

class SavedConversionsViewController: UIViewController {
    
    let realm = try! Realm()
    @IBOutlet weak var savedConversionsTableView: UITableView!
    
    var savedConversions: Results<Conversion>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        savedConversionsTableView.dataSource = self
        
        savedConversionsTableView.register(UINib(nibName: "ConversionCell", bundle: nil), forCellReuseIdentifier: "reusableConversionCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        loadConversions()

    }
    
    @objc func loadList(notification: NSNotification){
        savedConversionsTableView.reloadData()
    }
    
    func loadConversions() {
        savedConversions = realm.objects(Conversion.self)
    }
    
}

extension SavedConversionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if savedConversions?.count == 0 {
            tableView.setEmptyView(title: "Nothing has been saved yet", message: "Go and convert something")
        } else {
            tableView.restore()
        }
    
        return savedConversions?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableConversionCell", for: indexPath) as! ConversionCell
        
        if let data = savedConversions?[indexPath.row] {
            cell.fromLabel.text = "\(data.fromValue) \(data.fromUnit)"
            cell.toLabel.text = "\(data.result) \(data.toUnit)"
        }
        
        
        return cell
    }
    
    
}

