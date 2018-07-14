//
//  Day10ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/13.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day10ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let startPoint = CGPoint(x: 100, y: 200)
        let endPoint = CGPoint(x: 100, y: 500)
        let initialVelocity = CGPoint(x: 90, y: 45)


        let path = UIBezierPath(
            arcCenter: CGPoint(
                x: (endPoint.x - startPoint.x) / 2,
                y: (endPoint.y - startPoint.y) / 2
            ),
            radius: 100,
            startAngle: 0.9,
            endAngle: 0.1,
            clockwise: true
        )

        let targetView = UIView()
        targetView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        targetView.center = startPoint
        targetView.backgroundColor = .lightGray
        view.addSubview(targetView)

        let animation = CAKeyframeAnimation(keyPath: "positoin")
        animation.duration = 1.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.path = path.cgPath
        targetView.layer.add(animation, forKey: nil)


    }
}
