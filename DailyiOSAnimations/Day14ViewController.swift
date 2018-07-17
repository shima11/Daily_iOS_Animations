//
//  Day14ViewController.swift
//  DailyiOSAnimations
//
//  Created by jinsei shima on 2018/07/18.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit
import pop

class Day14ViewController: UIViewController {
    
    let targetView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        targetView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        targetView.center = view.center
        targetView.backgroundColor = .lightGray
        view.addSubview(targetView)
        
        let animation = POPSpringAnimation()
        targetView.layer.pop_add(animation, forKey: "spring")
    }
}
