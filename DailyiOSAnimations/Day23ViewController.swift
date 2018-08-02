//
//  Day23ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/08/02.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day23ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let badge = FloatingBadge(
            colors: [UIColor.gray.cgColor, UIColor.darkGray.cgColor],
            startPoint: CGPoint(x: 0, y: 0),
            endPoint: CGPoint(x: 1, y: 1)
        )

        badge.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        badge.center = view.center
        view.addSubview(badge)

    }
}

class FloatingBadge: UIView {

    let gradientLayer = CAGradientLayer()

    var scale: CGFloat = 1.2
    var animationDuration: TimeInterval = 1.4

    private let floatingAnimation = CABasicAnimation(keyPath: "transform.scale")

    init(colors: [CGColor], startPoint: CGPoint, endPoint: CGPoint) {

        super.init(frame: .zero)

        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint

        layer.addSublayer(gradientLayer)

        floatingAnimation.duration = animationDuration
        floatingAnimation.repeatCount = .infinity
        floatingAnimation.autoreverses = true
        floatingAnimation.toValue = scale
        floatingAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        gradientLayer.add(floatingAnimation, forKey: nil)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let value = min(bounds.width, bounds.height)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: value, height: value)
        gradientLayer.cornerRadius = value/2
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
