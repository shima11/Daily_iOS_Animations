//
//  Day16ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/21.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day16ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}


class CountUpLabel: UILabel {

    var timer: CADisplayLink?

    func count(from: Int, to: Int, duration: CGFloat) {

        timer?.invalidate()
        timer = nil

        timer = CADisplayLink(target: self, selector: #selector(updateValue(_:)))
        timer?.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
        timer?.add(to: RunLoop.main, forMode: RunLoopMode.UITrackingRunLoopMode)
    }

    @objc func updateValue(_ timer: Timer) {

    }
}
