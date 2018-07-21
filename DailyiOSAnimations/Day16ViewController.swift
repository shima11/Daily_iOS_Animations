//
//  Day16ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/21.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day16ViewController: UIViewController {

    let label = CountUpLabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        label.frame = CGRect(x: 0, y: 0, width: 120, height: 60)
        label.textAlignment = .center
        label.center = view.center
        view.addSubview(label)

        label.text = "count up label"

        let button = UIButton()
        button.setTitle("Count Up", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 120, height: 60)
        button.center = CGPoint(x: view.center.x, y: view.center.y + 120)
        button.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        view.addSubview(button)

    }

    @objc func tapButton(_ sender: UIControl) {
        label.count(from: 10, to: 100, duration: 2)
    }
}


class CountUpLabel: UILabel {

    var timer: CADisplayLink?

    var progress: TimeInterval = 0
    var lastUpdate: TimeInterval = 0
    var totalTime: TimeInterval = 0

    var fromValue: CGFloat = 0
    var toValue: CGFloat = 0

    var currentTime: TimeInterval {
        if progress >= totalTime { return TimeInterval(toValue) }
        return TimeInterval(fromValue) + (progress / totalTime) * TimeInterval(toValue - fromValue)
    }

    let completion: () -> Void = {}

    func count(from: CGFloat, to: CGFloat, duration: TimeInterval) {

        reset()

        fromValue = from
        toValue = to

        timer = CADisplayLink(target: self, selector: #selector(updateValue(_:)))
        timer?.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
        timer?.add(to: RunLoop.main, forMode: RunLoopMode.UITrackingRunLoopMode)

        totalTime = duration
        lastUpdate = Date.timeIntervalSinceReferenceDate
    }

    func reset() {

        timer?.invalidate()
        timer = nil

        progress = 0
        lastUpdate = 0
        totalTime = 0
    }

    @objc func updateValue(_ timer: Timer) {

        let now = Date.timeIntervalSinceReferenceDate
        progress += now - lastUpdate
        lastUpdate = now

        if progress >= totalTime {
            print("completion")
            reset()
        }

        text = String(format: "%.0f", currentTime)

    }
}
