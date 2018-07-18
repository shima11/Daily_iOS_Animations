//
//  Day7ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/11.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day7ViewController: UIViewController {

    let targetView = UIView()

    var animator: UIDynamicAnimator!
    var behavior1: UIDynamicBehavior!
    var behavior2: UIDynamicItemBehavior!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        targetView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        targetView.center = view.center
        targetView.backgroundColor = .lightGray
        targetView.isUserInteractionEnabled = true
        view.addSubview(targetView)

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.panEvent(_:)))
        targetView.addGestureRecognizer(panGesture)

        animator = UIDynamicAnimator(referenceView: view)
        behavior1 = UISnapBehavior(item: targetView, snapTo: targetView.center)
        behavior2 = UIDynamicItemBehavior(items: [targetView])
        animator.addBehavior(behavior1)
        animator.addBehavior(behavior2)

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
        label.textAlignment = .center
        label.text = "Drag Me"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .darkGray
        label.center = CGPoint(x: targetView.bounds.width / 2, y: targetView.bounds.height / 2)
        targetView.addSubview(label)

    }

    @objc func panEvent(_ sender: UIPanGestureRecognizer) {

        switch sender.state {
        case .began:
            animator.removeAllBehaviors()
        case .changed:
            guard let targetView = sender.view,
                let view = targetView.superview else { return }
            let translation = sender.translation(in: view)

            targetView.center = CGPoint(
                x: targetView.center.x + translation.x,
                y: targetView.center.y + translation.y
            )
            sender.setTranslation(.zero, in: view)

        case .cancelled, .ended, .failed:

            let velocity = sender.velocity(in: view)
            behavior2.addLinearVelocity(CGPoint(x: velocity.x * 10, y: velocity.y * 10), for: targetView)

            animator.addBehavior(behavior1)
            animator.addBehavior(behavior2)

        default:
            break
        }

    }
}
