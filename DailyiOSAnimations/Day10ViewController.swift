//
//  Day10ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/13.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day10ViewController: UIViewController {

    let targetView = UIView()

    let startPoint = CGPoint(x: UIScreen.main.bounds.width / 2, y: 200)
    let endPoint = CGPoint(x: UIScreen.main.bounds.width / 2, y: 500)
    let initialVelocity = CGPoint(x: 90, y: 45)


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        targetView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        targetView.center = startPoint
        targetView.backgroundColor = .lightGray
        view.addSubview(targetView)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapEvent(_:)))
        targetView.addGestureRecognizer(tapGesture)

    }

    @objc func tapEvent(_ sender: UITapGestureRecognizer) {

        let path = CGMutablePath()
        let midPoint = CGPoint(x: startPoint.x + 100, y: startPoint.y - 100 / 2.0)
        path.move(to: startPoint)
        path.addQuadCurve(to: endPoint, control: midPoint)

//        let bezierPath = UIBezierPath()
        
//        let path = UIBezierPath(
//            arcCenter: CGPoint(
//                x: (endPoint.x - startPoint.x) / 2,
//                y: (endPoint.y - startPoint.y) / 2
//            ),
//            radius: 10,
//            startAngle: 0.9,
//            endAngle: 0.1,
//            clockwise: true
//        )

        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 1.0
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.path = path

        targetView.layer.add(animation, forKey: nil)
    }

}



