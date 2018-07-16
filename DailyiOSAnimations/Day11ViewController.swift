//
//  Day11ViewController.swift
//  DailyiOSAnimations
//
//  Created by jinsei shima on 2018/07/16.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day11ViewController: UIViewController {
    
    let targetView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        targetView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        targetView.center = view.center
        targetView.backgroundColor = .lightGray
        view.addSubview(targetView)
        
        let drag = UIPanGestureRecognizer(target: self, action: #selector(drag(_:)))
        targetView.addGestureRecognizer(drag)
        
        
    }
    
    @objc func drag(_ sender: UIPanGestureRecognizer) {
        
        // TODO: animation後に呼ばれない
        
        switch sender.state {
            
        case .began:
            targetView.layer.removeAnimation(forKey: "animation1")
            
        case .changed:
            let translation = sender.translation(in: targetView)
            
            targetView.center = CGPoint(
                x: targetView.center.x + translation.x,
                y: targetView.center.y + translation.y
            )
            
            sender.setTranslation(.zero, in: targetView)
            
        case .ended:
            
            let velocity = sender.velocity(in: targetView)

            let bezierPath = UIBezierPath()
            bezierPath.move(to: targetView.center)
            bezierPath.addQuadCurve(
                to: view.center,
                controlPoint: CGPoint(
                    x: targetView.center.x + velocity.x/10,
                    y: targetView.center.y + velocity.y/10
                )
            )

            let animation = CAKeyframeAnimation(keyPath: "position")
            animation.timingFunctions = [CAMediaTimingFunction(controlPoints: 0.5, 1.1+Float(1/3), 1, 1)]
            animation.path = bezierPath.cgPath
            animation.isRemovedOnCompletion = false
            animation.fillMode = kCAFillModeForwards
            
            targetView.layer.add(animation, forKey: "animation1")
            
        default:
            break
            
        }
    }
}
