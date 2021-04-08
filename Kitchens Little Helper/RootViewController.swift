//
//  ViewController.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 16/03/2021.
//

import UIKit
import BetterSegmentedControl

class RootViewController: UIViewController, CustomPageViewControlIndexDelegate, ConversionDelegate {
    
    
    
    
    
    var converterManager = ConverterManager()
    
    var currentViewControllerIndex = 0
    
    @IBOutlet weak var segmentedControl: BetterSegmentedControl!
    
    
    @IBOutlet weak var convertButton: ConvertButton!
    
    
    let titles = ["Weight", "Volume", "Pan", "Oven"]
    
    var customPageViewController: CustomPageViewController!
    var dryIngredientsViewController = DryIngredientsViewController()
    
    var selectedIndex: Int = 0
    var indy = 0
    
    var unitQuant: String = ""
    var unitOne: String = ""
    var unitTwo: String = ""
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "customPageVCSegue" {
            if segue.destination.isKind(of: CustomPageViewController.self) {
                customPageViewController = segue.destination as? CustomPageViewController
            }
        }
        
        if segue.identifier == "goToResults" {
            let resultViewController = segue.destination as! ResultViewController
            print(converterManager.getConversionValue())
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        segmentedControl.delegate = self
        customPageViewController.indexDelegate = self
        dryIngredientsViewController.conversionDelegate = self
        
//
//        segmentedControl.setSegmentItems(titles)
//        segmentedControl.segmentsBackgroundColor = UIColor(named: "darkWhite")!
//        segmentedControl.backgroundColor = UIColor(named: "darkWhite")!
//        segmentedControl.isSliderShadowHidden = true
//        segmentedControl.sliderBackgroundColor = UIColor(named: "warmRed")!
//        segmentedControl.addTarget(self, action: #selector(segmentControlValueChanged(sender:)), for: .valueChanged)
//
//
//
//
//        print("SEGMENT CREATED")
        
        segmentedControl.segments = LabelSegment.segments(withTitles: titles, normalTextColor: .white, selectedTextColor: UIColor(red: 0.92, green: 0.29, blue: 0.15, alpha: 1.00))
        
        

    }
    
//    @objc func lol(_ sender: TwicketSegmentedControl) {
//        print("lol")
//    }
    
//    func segmentControlValueChanged() {
//        let selectedIndex = self.selectedIndex
//
//        if segmentedControl.selectedSegmentIndex > selectedIndex {
//            let nextIndex = selectedIndex + 1
//            for index in nextIndex...segmentedControl.selectedSegmentIndex {
//                customPageViewController.setViewControllerAt(index: index)
//            }
//        } else if segmentedControl.selectedSegmentIndex < selectedIndex {
//            let previousIndex = selectedIndex - 1
//            for index in (segmentedControl.selectedSegmentIndex...previousIndex).reversed() {
//                customPageViewController.setViewControllerAt(index: index)
//            }
//        }
//
//    }
    
    
    
    
    func callSegment() {
        
        //print("This gets called, \(type(of: segmentedControl))")
//        if let segment = segmentedControl {
//            print("TYpe of \(type(of: segment))")
//        }
        
        
        
        
        
    }
    
    @IBAction func convertButtonTapped(_ sender: ConvertButton) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                sender.setTitleColor(UIColor(named: "warmRed"), for: .normal)
                sender.backgroundColor = UIColor(named: "darkWhite")
            }
        }
        
        print(";;;;; \(unitQuant)")
        converterManager.convertUnits(value: unitQuant, unitOne: unitOne, unitTwo: unitTwo)
        
        performSegue(withIdentifier: "goToResults", sender: self)
        
        
    }
    
    @IBAction func convertButtonReleased(_ sender: ConvertButton) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                sender.setTitleColor(UIColor(named: "darkWhite"), for: .normal)
                sender.backgroundColor = UIColor(named: "warmRed")
            }
            
        }
        
        
    }
    
    @IBAction func convertButtonCancelled(_ sender: ConvertButton) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                sender.setTitleColor(UIColor(named: "warmRed"), for: .normal)
                sender.backgroundColor = UIColor(named: "darkWhite")
            }
        }
    }
    //    @IBAction func segmentedControlValueChanged(_ sender: TwicketSegmentedControl) {
//        //sender.sendActions(for: .valueChanged)
//        print("wwwww \(sender.selectedSegmentIndex)")
//    }
    
    
    
    func indexWasSetAt(_ index: Int) {
//        print("!@!£@!£!@£@£@!!@ \(index)")
        //indy = index
        
        segmentedControl.setIndex(index)
    }
    

    
    func converterSettingsWasSet(value: String, unitOne: String, unitTwo: String) {
        print("gets called")
        self.unitQuant = value
        self.unitOne = unitOne
        self.unitTwo = unitTwo
        
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: BetterSegmentedControl) {
//        print("£££££££ \(sender.index)")
        
        
        
        customPageViewController.setViewControllerAt(index: sender.index)
        
        
        
        
        //customPageViewController.setViewControllerAt(index: indy)
        
        
//        if sender.index > selectedIndex {
//            let nextIndex = selectedIndex + 1
//            for index in nextIndex...sender.index {
//                customPageViewController.setViewControllerAt(index: index)
//            }
//        } else if sender.index < selectedIndex {
//            let previousIndex = selectedIndex - 1
//            for index in (sender.index...previousIndex).reversed() {
//                customPageViewController.setViewControllerAt(index: index)
//            }
//        }
        
    }
    
}




