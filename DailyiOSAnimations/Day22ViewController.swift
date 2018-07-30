//
//  Day22ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/31.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

// https://www.calayer.com/core-animation/2017/12/25/cashapelayer-in-depth-part-ii.html

import UIKit

class Day22ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        shapeLayer.position = view.center

        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(shapeLayer)

        let originalPath = UIBezierPath(roundedRect: shapeLayer.bounds, cornerRadius: shapeLayer.bounds.size.width / 2)
        shapeLayer.path = originalPath.cgPath

        shapeLayer.lineWidth = 2.0
        shapeLayer.lineDashPattern = [8, 4]

        let dashPhaseAnimation = CABasicAnimation(keyPath: "lineDashPhase")
        dashPhaseAnimation.byValue = 12
        dashPhaseAnimation.duration = 1
        dashPhaseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        dashPhaseAnimation.repeatCount = .greatestFiniteMagnitude

        shapeLayer.add(dashPhaseAnimation, forKey: nil)

    }

}
