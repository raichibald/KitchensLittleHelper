//
//  ViewController.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 16/03/2021.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var conversionContentView: UIView!
    
    
    
    @IBOutlet weak var segmentedControl: CustomSegmentedControl!
    
    var customPageViewController: CustomPageViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "customPageVCSegue" {
            if segue.destination.isKind(of: CustomPageViewController.self) {
                customPageViewController = segue.destination as? CustomPageViewController
            }
        }
    }
    
    
    var currentViewControllerIndex = 0
    
//    lazy var viewControllerList: [UIViewController] = {
//        let dryVC = DryIngredientsViewController()
//        let wetVC = WetIngredientsViewController()
//        let panVC = PanViewController()
//        let ovenVC = OvenViewController()
//
//        return [dryVC, wetVC, panVC, ovenVC]
//    }()
    
//   lazy var viewControllerList: [UIViewController] = {
//        let dryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: DryIngredientsViewController.self))
//
//        let wetVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: WetIngredientsViewController.self))
//
//        let panVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: PanViewController.self))
//
//        let ovenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: OvenViewController.self))
//
//
//
//        return [dryVC, wetVC, panVC, ovenVC]
//    }()
//
//    let dryVC = DryIngredientsViewController()
//    let wetVC = WetIngredientsViewController()
//    let panVC = PanViewController()
//    let ovenVC = OvenViewController()
    
    let dataSource = ["Dry", "Wet", "Pan", "Oven"]
    
    
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        configurePageViewController()

    }
    
    
    
    
    
    
    @IBAction func segmentButtonPressed(_ sender: CustomSegmentedControl) {
        
        customPageViewController.setViewControllerAt(index: sender.selectedSegmentIndex)
        
        
//        button.addTarget(self, action: #selector(segmentButtonTapped(button:)), for: .touchUpInside)
        
//        guard let pageViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: CustomPageViewController.self)) as? CustomPageViewController else { return }
//
//        guard let startingViewController = detailViewControllerAt(index: sender.selectedSegmentIndex) else { return }
//        print("£££££££££££££££ \(sender.selectedSegmentIndex)")
//
//        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        
        
        
        
        
    }
    
    @objc func segmentButtonTapped(sender: CustomSegmentedControl) {
        print("---- \(sender)")
    }
    
//    func configurePageViewController() {
//        //All initialization logic
//
//        guard let pageViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: CustomPageViewController.self)) as? CustomPageViewController else { return }
//
//
//
//        pageViewController.delegate = self
//        pageViewController.dataSource = self
//
//
//        //Adding PageViewController as a child view controller
//        addChild(pageViewController)
//        pageViewController.didMove(toParent: self)
//
//        //Auto-layout
//        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
//
//        conversionContentView.addSubview(pageViewController.view)
//
//        let views: [String: Any] = ["pageView": pageViewController.view]
//
//        //Adding constraints to conversionContentView
//        conversionContentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
//
//        conversionContentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageView]-0-|", options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: views))
//
//
////        guard let startingViewController = detailViewControllerAt(index: currentViewControllerIndex) else { return }
////
////        pageViewController.setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
//
//        if let initialViewController = viewControllerList.first {
//            pageViewController.setViewControllers([initialViewController], direction: .forward, animated: true, completion: nil)
//        }
//
//    }
    
//    func detailViewControllerAt(index: Int) -> ConversionViewController? {
//
////        if index >= dataSource.count || dataSource.count == 0 {
////            return nil
////        }
////
////        guard let conversionViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: ConversionViewController.self)) as? ConversionViewController else { return nil }
////
////        conversionViewController.index = index
////        conversionViewController.displayText = dataSource[index]
//
//        if index >= viewControllerList.count || viewControllerList.count == 0 {
//            return nil
//        }
//
//
////        print("Gets Called ------ \(index)")
//
//        //let conversionViewController = viewController as? ConversionViewController
//
//        //guard var currentIndex = conversionViewController?.index else { return nil }
//
////        switch index {
////        case 0:
////            segmentedControl.selectedSegmentIndex = 0
////        case 1:
////            segmentedControl.selectedSegmentIndex = 1
////        case 2:
////            segmentedControl.selectedSegmentIndex = 2
////        case 3:
////            segmentedControl.selectedSegmentIndex = 3
////        default:
////            print("Could not load segmented control!")
////        }
//
//
////        if currentViewControllerIndex == 1 {
////            dryIndicatorButton.backgroundColor = .systemRed
////
////        } else {
////            dryIndicatorButton.backgroundColor = nil
////        }
//
////        return conversionViewController
//        return nil
//    }


}


//extension RootViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
//
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return currentViewControllerIndex
//    }
//
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return dataSource.count
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
//        if let pageItemController = pendingViewControllers[0] as? ConversionViewController {
//            print("????????? \(pageItemController.index)")
//            segmentedControl.selectedSegmentIndex = pageItemController.index
//
//
//            print("============ \(segmentedControl.selectedSegmentIndex)")
////            switch pageItemController.index {
////            case 0:
////                //segmentedControl.selectedSegmentIndex = 0
////                segmentedControl.selectedSegmentIndex = 0
////            case 1:
////                segmentedControl.selectedSegmentIndex = 1
////            case 2:
////                segmentedControl.selectedSegmentIndex = 2
////            case 3:
////                segmentedControl.selectedSegmentIndex = 3
////            default:
////                print("Could not load segmented control!")
////            }
//        }
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//
////        let conversionViewController = viewController as? ConversionViewController
////
////
////        guard var currentIndex = conversionViewController?.index, currentIndex > 0 else { return nil }
////        print("current index_1 \(currentIndex)")
////
////
//////        if currentIndex > 0 {
//////            return nil
//////        }
////        currentViewControllerIndex = currentIndex
////        currentIndex -= 1
////
////
////
////        //print("current index ------ \(currentIndex)")
////
////        return detailViewControllerAt(index: currentIndex)
//
//        guard let currentViewControllerIndex = viewControllerList.firstIndex(of: viewController) else { return nil }
//
//        let previousIndex = currentViewControllerIndex - 1
//
//        guard previousIndex >= 0 else { return nil }
//
//        guard viewControllerList.count > previousIndex else { return nil }
//
//        return viewControllerList[previousIndex]
//
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//
////        let conversionViewController = viewController as? ConversionViewController
////
////        guard var currentIndex = conversionViewController?.index, currentIndex < (dataSource.count - 1) else { return nil }
////        print("current index_2 \(currentIndex)")
////
//////        if currentIndex == dataSource.count - 1 {
//////            return nil
//////        }
////
////        currentIndex += 1
////        currentViewControllerIndex = currentIndex
////
////
////        //print("current index ------ \(currentIndex)")
////
////        return detailViewControllerAt(index: currentIndex)
//
//        guard let currentViewControllerIndex = viewControllerList.firstIndex(of: viewController) else { return nil }
//
//        let nextIndex = currentViewControllerIndex + 1
//        guard viewControllerList.count != nextIndex else { return nil }
//        guard viewControllerList.count > nextIndex else { return nil }
//
//        return viewControllerList[nextIndex]
//
//    }
//
//
//
//
//}
//



