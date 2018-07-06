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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        targetView.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        targetView.center = CGPoint(x: view.center.x, y: 150)
        targetView.backgroundColor = UIColor.lightGray
        view.addSubview(targetView)

        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = targetView.center
        animation.toValue = CGPoint(x: targetView.center.x, y: targetView.center.y + 200)
        animation.repeatCount = 0
        animation.duration = 1
        animation.autoreverses = true
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        animation.fillMode = kCAFillModeForwards
        targetView.layer.add(animation, forKey: "animation")
        targetView.layer.speed = 0.0

        slider.frame = CGRect(origin: .zero, size: CGSize(width: 200, height: 40))
        slider.center = CGPoint(x: view.center.x, y: view.center.y + 200)
        slider.addTarget(self, action: #selector(self.changeValue(_:)), for: .valueChanged)
        slider.minimumValue = 0
        slider.maximumValue = 1
        view.addSubview(slider)
    }

    @objc func changeValue(_ sender: UISlider) {
        setProgressLayer(layer: targetView.layer, progress: sender.value)
    }

    func setProgressLayer(layer: CALayer, progress: Float) {
        layer.timeOffset = Double(progress)
        layer.beginTime = Double(progress)
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
