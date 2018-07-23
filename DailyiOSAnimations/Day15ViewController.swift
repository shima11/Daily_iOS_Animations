//
//  Day15ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/20.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day15ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let targetView = UIView()
        targetView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        targetView.center = view.center
        targetView.backgroundColor = .lightGray
        view.addSubview(targetView)

        CATransaction.begin()
        CATransaction.setAnimationDuration(2)
        CATransaction.setCompletionBlock({
            print("completion")
        })

        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.toValue = 2
        animation.autoreverses = true
        targetView.layer.add(animation, forKey: nil)
        
        CATransaction.commit()
        
    }

}
