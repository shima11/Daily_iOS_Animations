//
//  Day5ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/08.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day5ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = view.bounds
        view.layer.addSublayer(replicatorLayer)

        let ball = CALayer()
        ball.bounds = CGRect(x: 0, y: 0, width: 10, height: 10)
        ball.position = view.center
        ball.position.x -= 30
        ball.backgroundColor = UIColor.lightGray.cgColor
        ball.cornerRadius = 5

        let animation = CABasicAnimation(keyPath: "position.y")
        animation.toValue = ball.position.y + 10

        let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorAnimation.toValue = UIColor.darkGray.cgColor

        let group = CAAnimationGroup()
        group.animations = [animation, colorAnimation]
        group.duration = 0.6
        group.autoreverses = true
        group.repeatCount = .infinity
        group.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)

        ball.add(group, forKey: nil)

        replicatorLayer.addSublayer(ball)

        replicatorLayer.instanceCount = 4
        replicatorLayer.instanceDelay = 0.1
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(20, 0, 0.0)

//        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
//        rotationAnimation.toValue = -2.0 * Double.pi
//        rotationAnimation.duration = 6.0
//        rotationAnimation.repeatCount = .infinity
//        rotationAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
//        replicatorLayer.add(rotationAnimation, forKey: nil)

    }
}
