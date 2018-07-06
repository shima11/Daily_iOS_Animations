//
//  Day3ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/06.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day3ViewController: UIViewController {

    let targetView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        targetView.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        targetView.center = CGPoint(x: view.center.x, y: 150)
        targetView.backgroundColor = UIColor.lightGray
        view.addSubview(targetView)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapEvent(_:)))
        view.addGestureRecognizer(tapGesture)

        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = targetView.center
        animation.toValue = CGPoint(x: targetView.center.x, y: targetView.center.y + 200)
        animation.repeatCount = 10
        animation.duration = 1
        animation.autoreverses = true
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        targetView.layer.add(animation, forKey: "animation")

        targetView.layer.speed = 0.0
        targetView.layer.timeOffset = targetView.layer.convertTime(CACurrentMediaTime(), from: nil)

    }

    private var isTapped = false
    
    @objc func tapEvent(_ sender: UITapGestureRecognizer) {
        
        let layer = targetView.layer
        if isTapped {
            pauseLayer(layer: layer)
        } else {
            resumeLayer(layer: layer)
        }
        isTapped = !isTapped
    }
    
    func pauseLayer(layer: CALayer) {
        
        layer.speed = 0.0
        layer.timeOffset = layer.convertTime(CACurrentMediaTime(), from: nil)
    }
    
    func resumeLayer(layer: CALayer) {
        
        let pauseTime = layer.timeOffset
        layer.speed = 1.0
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        layer.beginTime = layer.convertTime(CACurrentMediaTime(), from: nil) - pauseTime
    }

}
