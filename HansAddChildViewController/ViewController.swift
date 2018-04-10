//
//  ViewController.swift
//  HansAddChildViewController
//
//  Created by hans on 2018/4/10.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let firstViewController  = FirstViewController()
    let secondViewController  = SecondViewController()
    var currentViewController :UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label  = UILabel(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
        label.textColor = UIColor.blue
        label.text = "Root View Controller"
        self.view.addSubview(label)
        
        let changeBtn = UIButton(frame: CGRect(x: 100, y: 310, width: 80, height: 35))
        changeBtn.setTitle("Change", for: .normal)
        changeBtn.backgroundColor = UIColor.green
        changeBtn.addTarget(self, action: #selector(changeViewControler), for: .touchUpInside)
        self.view.addSubview(changeBtn)
        
        let removeAllBtn = UIButton(frame: CGRect(x: 200, y: 310, width: 80, height: 35))
        removeAllBtn.setTitle("Remove All Child", for: .normal)
        removeAllBtn.backgroundColor = UIColor.green
        removeAllBtn.addTarget(self, action: #selector(remove), for: .touchUpInside)
        self.view.addSubview(removeAllBtn)
        
        addChildViewController(firstViewController)
        firstViewController.view.frame = CGRect(x: 50, y: 100, width: 200, height: 200)
        self.view.addSubview(firstViewController.view)
        didMove(toParentViewController: self)
        currentViewController = firstViewController
    }
    
    @objc func changeViewControler() {
        var next : UIViewController = secondViewController
        if(currentViewController == secondViewController){
            next = firstViewController
        }
        self.flip(from: currentViewController, to: next, withDirection: .curveLinear)
    }
    
    @objc func remove() {
        currentViewController?.willMove(toParentViewController: nil)
        self.currentViewController?.view.removeFromSuperview()
        self.currentViewController?.didMove(toParentViewController: self)
        //  2
        self.currentViewController?.removeFromParentViewController()
        
        
    }
    
    func flip(from fromController: UIViewController?, to toController: UIViewController?, withDirection direction: UIViewAnimationOptions) {
        toController?.view.frame = (fromController?.view.frame)!
        //  1
        if let aController = toController {
            addChildViewController(aController)
        }
        //
        fromController?.willMove(toParentViewController: nil)
        //
        if let aController = fromController, let aController1 = toController {
            transition(from: aController, to: aController1, duration: 0.2, options: [direction, .curveEaseIn], animations: nil, completion: {(_ finished: Bool) -> Void in
                toController?.didMove(toParentViewController: self)
                //  2
                fromController?.removeFromParentViewController()
                //  3
                self.currentViewController = toController
            })
        }
        
    }

    private func transitionFromViewController(fromController: UIViewController, toController: UIViewController, options: UIViewAnimationOptions) {
        
        toController.view.frame = fromController.view.bounds
        self.addChildViewController(toController)
        fromController.willMove(toParentViewController: nil)
        
        self.view.addSubview(toController.view)
        
        UIView.transition(from: fromController.view, to: toController.view, duration: 1.0, options: options, completion: { (finished) -> Void in
            toController.didMove(toParentViewController: self)
            
            fromController.removeFromParentViewController()
            fromController.view.removeFromSuperview()
        })
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

