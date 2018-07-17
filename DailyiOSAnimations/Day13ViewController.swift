//
//  Day13ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/17.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day13ViewController: UIViewController {

    let targetView = UIView()
    let button = UIButton()

    var animator: UIDynamicAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        targetView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        targetView.center = view.center
        targetView.backgroundColor = .lightGray
        view.addSubview(targetView)

        button.setTitle("tap", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        button.center = CGPoint(x: view.center.x, y: UIScreen.main.bounds.height * 0.8)
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        view.addSubview(button)

        animator = UIDynamicAnimator(referenceView: view)
    }

    @objc func tapped() {

        print("tapped")
        
        let snapBehavior = UISnapBehavior(item: targetView, snapTo: view.center)
        animator.addBehavior(snapBehavior)
        let pushBehavior = UIPushBehavior(items: [targetView], mode: UIPushBehaviorMode.instantaneous)
//        pushBehavior.magnitude = 100
//        pushBehavior.angle = 0.5
        pushBehavior.pushDirection = CGVector(dx: 100, dy: 100)
        animator.addBehavior(pushBehavior)
    }
}
