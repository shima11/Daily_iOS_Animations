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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let label = UILabel()

        label.text = "Tap Me"
        label.font = smallFont
        label.center = view.center
        label.bounds.size = label.intrinsicContentSize
        label.isUserInteractionEnabled = true

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapEvent(_:)))
        label.addGestureRecognizer(tapGesture)

        view.addSubview(label)

    }


    @objc func tapEvent(_ sender: UITapGestureRecognizer) {

        guard let label = sender.view as? UILabel else { return }

        switch state {
        case .expand:

            let copy = copyLabel(source: label)
            copy.font = smallFont

            let transform = scaleTransform(
                from: label.bounds.size,
                to: copy.intrinsicContentSize
            )

            UIView.animate(
                withDuration: 0.6,
                delay: 0,
                options: [
                    .curveEaseInOut,
                    .allowUserInteraction,
                ],
                animations: {
                    label.transform = transform
            },
                completion: { _ in
                    label.font = self.smallFont
                    label.transform = .identity
                    label.bounds.size = label.intrinsicContentSize
            }
            )
            self.state = .shrink

        case .shrink:

            let copy = copyLabel(source: label)
            copy.font = largeFont

            let transform = scaleTransform(
                from: label.bounds.size,
                to: copy.intrinsicContentSize
            )

            UIView.animate(
                withDuration: 0.6,
                delay: 0,
                options: [
                    .curveEaseInOut,
                    .allowUserInteraction,
                ],
                animations: {
                    label.transform = transform
            },
                completion: { _ in
                    label.font = self.largeFont
                    label.transform = .identity
                    label.bounds.size = copy.intrinsicContentSize
            }
            )
            self.state = .expand

        }

    }

    func copyLabel(source: UILabel) -> UILabel {

        let label = UILabel()
        label.frame = source.frame
        label.font = source.font
        label.text = source.text
        return label
    }

    func scaleTransform(from: CGSize, to: CGSize) -> CGAffineTransform {

        let scaleX = to.width / from.width
        let scaleY = to.height / from.height
        return CGAffineTransform(scaleX: scaleX, y: scaleY)
    }
}
