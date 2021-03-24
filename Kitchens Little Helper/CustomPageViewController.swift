//
//  CustomPageViewController.swift
//  Kitchens Little Helper
//
//  Created by Raitis Saripo on 19/03/2021.
//

import UIKit

class CustomPageViewController: UIPageViewController {
    
    lazy var viewControllerList: [UIViewController] = {
        let dryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: DryIngredientsViewController.self)) as! DryIngredientsViewController
         
         let wetVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: WetIngredientsViewController.self)) as! WetIngredientsViewController
         
         let panVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: PanViewController.self)) as! PanViewController
         
         let ovenVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: OvenViewController.self)) as! OvenViewController
         
         
         
         return [dryVC, wetVC, panVC, ovenVC]
     }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        setViewControllerAt(index: 0)
    }
    
    func setViewControllerAt(index: Int) {
        setViewControllers([viewControllerList[index]], direction: .forward, animated: true, completion: nil)
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
        
        let previousIndex = currentViewControllerIndex - 1
        
        guard previousIndex >= 0 else { return nil }
        
        guard viewControllerList.count > previousIndex else { return nil }
        
        return viewControllerList[previousIndex]
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentViewControllerIndex = viewControllerList.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = currentViewControllerIndex + 1
        guard viewControllerList.count != nextIndex else { return nil }
        guard viewControllerList.count > nextIndex else { return nil }
        
        return viewControllerList[nextIndex]
    }
    
    
}
