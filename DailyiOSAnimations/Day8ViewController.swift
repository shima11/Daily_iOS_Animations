//
//  Day8ViewController.swift
//  DailyiOSAnimations
//
//  Created by jinsei shima on 2018/07/12.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day8ViewController: UIViewController {
    
    
    let controlButtonView = UIView()
    
    var scaleAnimator: UIViewPropertyAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        controlButtonView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        controlButtonView.center = view.center
        controlButtonView.backgroundColor = UIColor.darkGray
        controlButtonView.layer.cornerRadius = 8.0
        controlButtonView.clipsToBounds = true
        view.addSubview(controlButtonView)
        
        if traitCollection.forceTouchCapability == .available {
            let forceGesture = ForceTouchGestureRecognizer(target: self, action: #selector(self.forceTouchAction(_:)))
            controlButtonView.addGestureRecognizer(forceGesture)
        }
        else {
            print("force touch capability unabailable")
        }
        
    }

    var initialBounds: CGRect = .zero

    @objc func forceTouchAction(_ sender: ForceTouchGestureRecognizer) {
        
        switch sender.state {
        case .began:
            
            initialBounds = controlButtonView.bounds
            
            scaleAnimator = UIViewPropertyAnimator(duration: 0.16, curve: UIViewAnimationCurve.easeInOut, animations: {
                self.controlButtonView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            })
            scaleAnimator.startAnimation()
            scaleAnimator.pauseAnimation()
            
        case .changed:
            
            scaleAnimator.fractionComplete = sender.progress
            
        case .ended,.cancelled, .failed, .possible:
            
            scaleAnimator.isReversed = true
            scaleAnimator.startAnimation()

        }
        
    }
    
}

class ForceTouchGestureRecognizer: UIGestureRecognizer {
    
    var forceValue: CGFloat = 0.0
    var maximumForceValue: CGFloat = 0.0
    
    var progress: CGFloat {
        return forceValue / maximumForceValue
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        self.state = .began
        forceTouch(touches: touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        self.state = .changed
        forceTouch(touches: touches)
        
        if forceValue >= maximumForceValue {
            self.state = .ended
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        self.state = .ended
        forceTouch(touches: touches)
    }

    private func forceTouch(touches: Set<UITouch>) {

        guard (touches.count == 1), let touch = touches.first else {
            state = .failed
            return
        }

        forceValue = touch.force
        maximumForceValue = touch.maximumPossibleForce

        print(forceValue, maximumForceValue, progress)
    }

    override func reset() {
        super.reset()
        forceValue = 0.0
        maximumForceValue = 0.0
    }

}
