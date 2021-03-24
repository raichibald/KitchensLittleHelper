//
//  ConversionViewController.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 19/03/2021.
//

import UIKit

class ConversionViewController: UIViewController {

    
    @IBOutlet weak var displayLabel: UILabel!
    var displayText: String?
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        displayLabel.text = displayText
        
        //print(">>>>>>>> \(index)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
