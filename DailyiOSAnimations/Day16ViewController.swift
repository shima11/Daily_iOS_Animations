//
//  Day16ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/21.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

// https://medium.com/ios-os-x-development/swift-3-so-i-wanted-to-animate-a-label-14dd2b332ef9
// https://github.com/EyreFree/EFCountingLabel/blob/master/EFCountingLabel/Classes/EFCountingLabel.swift

class Day16ViewController: UIViewController {

    let countUpLabel = CountUpLabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        countUpLabel.frame = CGRect(x: 0, y: 0, width: 120, height: 60)
        countUpLabel.textAlignment = .center
        countUpLabel.center = view.center
        view.addSubview(countUpLabel)

        countUpLabel.text = "count up label"

        let button = UIButton()
        button.setTitle("Count Up", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 120, height: 60)
        button.center = CGPoint(x: view.center.x, y: view.center.y + 120)
        button.addTarget(self, action: #selector(tapButton(_:)), for: .touchUpInside)
        view.addSubview(button)

    }

    @objc func tapButton(_ sender: UIControl) {
        countUpLabel.count(from: 10, to: 100, duration: 2) {
            print("completion")
        }
    }
    
}


final class CountUpLabel: UILabel {

    private var timer: CADisplayLink?

    private var progress: TimeInterval = 0
    private var lastUpdate: TimeInterval = 0
    private var totalTime: TimeInterval = 0

    private var fromValue: CGFloat = 0
    private var toValue: CGFloat = 0

    private var currentTime: TimeInterval {
        if progress >= totalTime { return TimeInterval(toValue) }
        let percent = progress / totalTime
        return TimeInterval(fromValue) + percent * TimeInterval(toValue - fromValue)
    }

    private var completion: () -> Void = {}

    func count(from: CGFloat, to: CGFloat, duration: TimeInterval, completion: @escaping () -> Void) {

        reset()

        fromValue = from
        toValue = to

        self.completion = completion

        timer = CADisplayLink(target: self, selector: #selector(updateValue(_:)))
        timer?.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
//        timer?.add(to: RunLoop.main, forMode: RunLoopMode.UITrackingRunLoopMode) // why?

        totalTime = duration
        lastUpdate = Date.timeIntervalSinceReferenceDate
    }

    private func reset() {

        timer?.invalidate()
        timer = nil

        progress = 0
        lastUpdate = 0
        totalTime = 0
    }

    @objc private func updateValue(_ timer: Timer) {

        let now = Date.timeIntervalSinceReferenceDate
        progress += now - lastUpdate
        lastUpdate = now

        print(
            "current time(from-to):", currentTime,
            "progress(duration):", progress,
            "time since reference date:", now
        )

        if progress >= totalTime {
            completion()
            reset()
        }

        text = String(format: "%.0f", currentTime)
    }
}
