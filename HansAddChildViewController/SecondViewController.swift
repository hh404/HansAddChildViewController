//
//  SecondViewController.swift
//  HansAddChildViewController
//
//  Created by hans on 2018/4/10.
//  Copyright © 2018年 hans. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.red
        let label  = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: 200))
        label.textColor = UIColor.green
        label.text = "Second View Controller"
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
