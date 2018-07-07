//
//  Day4ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/07.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

class Day4ViewController: UIViewController {

    enum State {
        case shrink, expand
    }

    var state: State = .shrink

    let smallFont = UIFont.systemFont(ofSize: 20, weight: .bold)
    let largeFont = UIFont.systemFont(ofSize: 80, weight: .bold)

    var scale: CGFloat {
        return smallFont.capHeight / largeFont.capHeight
    }

    var smallTrasform: CGAffineTransform {
        return CGAffineTransform(scaleX: scale, y: scale)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let label = UILabel()

        label.text = "Tap Me"
        label.font = largeFont
        label.center = view.center
        label.bounds.size = label.intrinsicContentSize
        label.isUserInteractionEnabled = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapEvent(_:)))
        label.addGestureRecognizer(tapGesture)

        label.transform = smallTrasform

        view.addSubview(label)

    }


    @objc func tapEvent(_ sender: UITapGestureRecognizer) {

        guard let label = sender.view else { return }

        switch state {
        case .shrink:
            UIView.animate(
                withDuration: 0.2,
                delay: 0,
                options: [UIViewAnimationOptions.curveEaseInOut, UIViewAnimationOptions.allowUserInteraction],
                animations: {
                    label.transform = .identity
            },
                completion: nil
            )
            self.state = .expand

        case .expand:
            UIView.animate(
                withDuration: 0.2,
                delay: 0,
                options: [UIViewAnimationOptions.curveEaseInOut, UIViewAnimationOptions.allowUserInteraction],
                animations: {
                    label.transform = self.smallTrasform
            },
                completion: nil
            )
            self.state = .shrink

        }

    }
}
