//
//  CustomPageViewController.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 19/03/2021.
//

import UIKit

protocol CustomPageViewControlIndexDelegate: class {
    func indexWasSetAt(_ index: Int)
}

class CustomPageViewController: UIPageViewController {
    
    
    
    var root = RootViewController()
    
    weak var indexDelegate: CustomPageViewControlIndexDelegate?
    
    var unitValue: String = ""
    var unitTextOne: String = ""
    var unitTextTwo: String = ""
    
    
    
    
    lazy var viewControllerList: [UIViewController] = {
        let dryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: DryIngredientsViewController.self)) as! DryIngredientsViewController
         
         let wetVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: WetIngredientsViewController.self)) as! WetIngredientsViewController
         
         let panVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: PanViewController.self)) as! PanViewController
         
         let ovenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: OvenViewController.self)) as! OvenViewController
         
         
         
         return [dryVC, wetVC, panVC, ovenVC]
     }()
    
    var currentVCIndex = 0
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        setViewControllerAt(index: 0)
        
        
    }
    
    func setViewControllerAt(index: Int) {
        //current index = 0
        //index = 2
//        print("$$$$$$$$ currentVCIndex \(currentVCIndex)")
//        print("++++++++++ index to set \(index)")
        if currentVCIndex <= index {
            //Forwards
            setViewControllers([viewControllerList[index]], direction: .forward, animated: true, completion: nil)
        } else {
            //Backwards
            setViewControllers([viewControllerList[index]], direction: .reverse, animated: true, completion: nil)
        }
        currentVCIndex = index
        
        
        //setViewControllers([viewControllerList[index]], direction: .forward, animated: true, completion: nil)
    }
    

}

extension CustomPageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllerList.count
    }
    
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return currentViewControllerIndex
//    }

    
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentViewControllerIndex = viewControllerList.firstIndex(of: viewController) else { return nil }
        
        currentVCIndex = currentViewControllerIndex
        print("---- \(currentVCIndex)")
//        indexDelegate?.indexWasSetAt(currentVCIndex)
        
        let previousIndex = currentViewControllerIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        
        guard viewControllerList.count > previousIndex else { return nil }
        
        return viewControllerList[previousIndex]
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentViewControllerIndex = viewControllerList.firstIndex(of: viewController) else { return nil }
        currentVCIndex = currentViewControllerIndex
        print(">>>>> \(currentVCIndex)")
//        indexDelegate?.indexWasSetAt(currentViewControllerIndex)
        let nextIndex = currentViewControllerIndex + 1
        guard viewControllerList.count != nextIndex else { return nil }
        guard viewControllerList.count > nextIndex else { return nil }
        
        return viewControllerList[nextIndex]
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed,
              let currentVC = pageViewController.viewControllers?.first,
              let index = viewControllerList.firstIndex(of: currentVC) else { return }
        currentVCIndex = index
        //root.indy = currentVCIndex
        
        
        
        
        root.callSegment()
        indexDelegate?.indexWasSetAt(index)
        
        
        
        print(index)
        
    }
    
    
    
    
    
    
}
