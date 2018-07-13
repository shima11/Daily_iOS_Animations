//
//  Day6ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/10.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day6ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let targetView = UIView()
        targetView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        targetView.center = view.center
        targetView.backgroundColor = UIColor.lightGray
        view.addSubview(targetView)

        let animation = CASpringAnimation(keyPath: "position")
        animation.duration = 1
        animation.repeatCount = .infinity
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: targetView.center.x - 100, y: targetView.center.y)
        animation.toValue = CGPoint(x: targetView.center.x + 100, y: targetView.center.y)
        animation.damping = 4
        animation.initialVelocity = 2
        animation.mass = 2
        animation.stiffness = 8

        targetView.layer.add(animation, forKey: "transform")
    }
}
