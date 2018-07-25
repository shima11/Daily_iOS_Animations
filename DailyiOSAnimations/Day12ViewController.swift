//
//  Day12ViewController.swift
//  DailyiOSAnimations
//
//  Created by jinsei shima on 2018/07/16.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

// reference url
// https://collectiveidea.com/blog/archives/2017/12/04/cabasicanimation-for-animating-strokes-plus-a-bonus-gratuitous-ui-interaction

class Day12ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        let label = UILabel()
        label.text = "Tap AnyWhere"
        label.sizeToFit()
        label.textColor = .darkGray
        label.center = view.center
        view.addSubview(label)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapEvent(_:)))
        view.addGestureRecognizer(tapGesture)

    }

    @objc func tapEvent(_ sender: UITapGestureRecognizer) {

        switch sender.state {
        case .ended:
            let pop = PopView()
            pop.center = sender.location(in: view)
            view.addSubview(pop)

        default:
            break
        }
    }
}

private final class PopView: UIView {

    init() {

        super.init(frame: CGRect(x: 0, y: 0, width: 30, height: 30))

        let count: Int = 6
        for index in 1...count {
            let line = Line()
            line.position = center
            let angle = CGFloat.pi * 2 / CGFloat(count) * CGFloat(index)
            line.transform = CATransform3DMakeRotation(angle, 0, 0, 1)
            layer.addSublayer(line)
            line.animate()
        }

        let minOffset: UInt32 = 0
        let maxOffset: UInt32 = 200
        let rotation = CGFloat(arc4random_uniform(maxOffset - minOffset) + minOffset) / CGFloat(100)
        transform = CGAffineTransform(rotationAngle: rotation)

    }

    deinit {
        print("PopView - deinit")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private final class Line: CAShapeLayer {

    override init() {
        super.init()

        createLine()
    }

    override init(layer: Any) {
        super.init(layer: layer)

        createLine()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createLine() {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 15, y: 0))

        let random = CGFloat(arc4random_uniform(45 - 25) + 25)
        bezierPath.addLine(to: CGPoint(x: random, y: 0))

        lineWidth = 2
        lineCap = kCALineCapRound
        strokeColor = UIColor.darkGray.cgColor
        path = bezierPath.cgPath
    }

    func animate() {

        let duration: TimeInterval = 0.6

        let end = CABasicAnimation(keyPath: "strokeEnd")
        end.fromValue = 0
        end.toValue = 1.075
        end.beginTime = 0
        end.duration = duration * 0.75
        end.timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.88, 0.09, 0.99)
        end.fillMode = kCAFillModeForwards

        let start = CABasicAnimation(keyPath: "strokeStart")
        start.fromValue = 0
        start.toValue = 1.075
        start.beginTime = duration * 0.15
        start.duration = duration * 0.85
        start.timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.88, 0.09, 0.99)
        start.fillMode = kCAFillModeBackwards

        let group = CAAnimationGroup()
        group.duration = duration
        group.animations = [end, start]

        strokeEnd = 1
        strokeStart = 1

        add(group, forKey: nil)

    }

}
