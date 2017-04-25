//
//  ViewController.swift
//  iOSJenkinsCI
//
//  Created by Jenkins on 25/4/17.
//  Copyright © 2017 Jenkins. All rights reserved.
//

import UIKit
import RxCocoa

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        let button = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 20))
        self.view.addSubview(button)
        button.rx.tap.subscribe { _ in
            debugPrint("fjsldjfskdf")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

