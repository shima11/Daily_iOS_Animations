//
//  Day2ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/06.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import Foundation
import UIKit

class Day2ViewController: UIViewController {

    let targetView = UIView()
    let slider = UISlider()

    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        targetView.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        targetView.center = CGPoint(x: view.center.x, y: 150)
        targetView.backgroundColor = UIColor.lightGray
        view.addSubview(targetView)

        slider.frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 40))
        slider.center = CGPoint(x: view.center.x, y: view.center.y + 200)
        slider.addTarget(self, action: #selector(self.changeValue(_:)), for: .valueChanged)
        slider.minimumValue = 0
        slider.maximumValue = 1
        view.addSubview(slider)

        button.frame = CGRect(x: 0, y: 0, width: 80, height: 60)
        button.center = CGPoint(x: view.center.x, y: view.center.y + 250)
        button.titleLabel?.text = "Resume"
        button.backgroundColor = UIColor.lightGray
        button.addTarget(self, action: #selector(self.tapButton(_:)), for: .touchUpInside)
        view.addSubview(button)

        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = targetView.center
        animation.toValue = CGPoint(x: targetView.center.x, y: targetView.center.y + 200)
//        animation.repeatCount = 0
//        animation.autoreverses = true

        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1.0
        scaleAnimation.toValue = 2.0

        let animations = CAAnimationGroup()
        animations.duration = 1.0
        animations.animations = [animation, scaleAnimation]
        animations.fillMode = kCAFillModeForwards

        animations.delegate = self

        targetView.layer.removeAllAnimations()
        targetView.layer.add(animations, forKey: nil)

        targetView.layer.speed = 0.0

    }

    @objc func changeValue(_ sender: UISlider) {
        setProgressLayer(layer: targetView.layer, progress: sender.value)
    }

    @objc func tapButton(_ sender: UIColor) {
        print("tap button")
        let timeOffset = targetView.layer.timeOffset
        targetView.layer.speed = 1.0
        targetView.layer.timeOffset = 0.0
        targetView.layer.beginTime = 0.0
        targetView.layer.beginTime = targetView.layer.convertTime(CACurrentMediaTime(), from: nil) - timeOffset
    }

    func setProgressLayer(layer: CALayer, progress: Float) {
        layer.timeOffset = Double(progress)
        layer.beginTime = layer.convertTime(CACurrentMediaTime(), from: nil)
    }



}

extension Day2ViewController : CAAnimationDelegate {

    func animationDidStart(_ anim: CAAnimation) {
        print("animationDidStart", anim)
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("animationDidStop", anim)
    }
}
