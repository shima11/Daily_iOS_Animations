//
//  Day6ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/10.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day6ViewController: UIViewController {

    let targetView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        targetView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        targetView.center = view.center
        targetView.backgroundColor = UIColor.lightGray
        view.addSubview(targetView)

//        CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform"];
//        animation.duration = 0.5;
//        animation.repeatCount = 1;
//        animation.autoreverses = YES;
//        CATransform3D transform = CATransform3DMakeRotation(M_PI, 0.0, 1.0, 0.0);
//        animation.toValue = [NSNumber valueWithCATransform3D:transform];
//        [rotationLabel.layer addAnimation:animation forKey:@"transform"];

        let animation = CABasicAnimation(keyPath: "transform")
        animation.duration = 1
        animation.repeatCount = .infinity
        let transform = CATransform3DMakeRotation(CGFloat(Double.pi), 0, 1.0, 0)
        animation.toValue = transform
        targetView.layer.add(animation, forKey: "transform")
    }
}
