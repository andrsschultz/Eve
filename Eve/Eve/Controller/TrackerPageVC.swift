//
//  TrackerPageVC.swift
//  Eve
//
//  Created by Andreas Schultz on 04.02.19.
//  Copyright © 2019 Andreas Schultz. All rights reserved.
//

import UIKit

class TrackerPageVC: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    //PROPERTIES
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newVc(viewController: "ErnährungNC"),
                self.newVc(viewController: "WasserNC"),
                self.newVc(viewController: "MobilitätNC"),
                self.newVc(viewController: "Abfall&KonsumNC")]
    }()
    
    var pageControl = UIPageControl()
    var button = UIButton()
    
    
    //OVERRIDE FUNCS

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
        // This sets up the first view that will show up on our page control
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        self.delegate = self
        configurePageControl()
        configureButton()
        
    }
    
    
    
    //CUSTOM FUNCS

    func newVc(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.6745098039, green: 0.6745098039, blue: 0.6745098039, alpha: 1)
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    
    //configuration of the next buttton in the lower right corner
    func configureButton() {
        button = UIButton(frame: CGRect(x: self.view.frame.width-20-64, y: self.view.frame.height-30-64, width: 64, height: 64))
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "weiterButton.png"), for: .normal)
        button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func buttonClicked() {
        if pageControl.currentPage == 3 {
            //Tracking abschließen
        } else {
            goToNextPage()
        }
    }
    
    //change image of button depending on current position
    func adjustButtonImage() {
        switch pageControl.currentPage {
        case 0:
            self.button.setImage(UIImage(named: "weiterButton.png"), for: .normal)
        case 1:
            button.setImage(UIImage(named: "weiterButtonBlau.png"), for: .normal)
        case 2:
            button.setImage(UIImage(named: "weiterButtonRosa.png"), for: .normal)
        case 3:
            button.setImage(UIImage(named: "fertigButton.png"), for: .normal)
        default:
            button.setImage(UIImage(named: "weiterButton.png"), for: .normal)
        }
    }
    
    // MARK: Data source functions.
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            //return orderedViewControllers.last
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        adjustButtonImage()
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            //return orderedViewControllers.first
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        adjustButtonImage()
        return orderedViewControllers[nextIndex]
    }

    
    // MARK: Delegate functions
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
    }
    
    
    func goToNextPage(animated: Bool = true) {
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else { return }
        setViewControllers([nextViewController], direction: .forward, animated: animated, completion: { completed in self.delegate?.pageViewController?(self, didFinishAnimating: true, previousViewControllers: [], transitionCompleted: completed); self.adjustButtonImage() })
    }
    

}
