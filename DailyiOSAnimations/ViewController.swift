//
//  ViewController.swift
//  DailyiOSAnimations
//
//  Created by Jinsei Shima on 2018/07/05.
//  Copyright © 2018 Jinsei Shima. All rights reserved.
//

import UIKit

struct Model {
    
    let name: String
    let subTitle: String
    let viewController: UIViewController
}

class ViewController: UIViewController {

    let tableView = UITableView()
    
    let models: [Model] = [
        Model(name: "Day1", subTitle: "UIPanGestureRecognizer", viewController: Day1ViewController()),
        Model(name: "Day2", subTitle: "CALayer fractionComplete", viewController: Day2ViewController()),
        Model(name: "Day3", subTitle: "CALayer pause and resume", viewController: Day3ViewController()),
        Model(name: "Day4", subTitle: "Scale animation for UILabel", viewController: Day4ViewController()),
        Model(name: "Day5", subTitle: "CAReplicatorLayer", viewController: Day5ViewController()),
        Model(name: "Day6", subTitle: "CASpringAnimation", viewController: Day6ViewController()),
        Model(name: "Day7", subTitle: "UIDynamicAnimation1", viewController: Day7ViewController()),
        Model(name: "Day8", subTitle: "Force Touch Gesture", viewController: Day8ViewController()),
        Model(name: "Day9", subTitle: "Reverse Animation", viewController: Day9ViewController()),
        Model(name: "Day10", subTitle: "CGPath Animation", viewController: Day10ViewController()),
        Model(name: "Day11", subTitle: "UIBezierPath Animation", viewController: Day11ViewController()),
        Model(name: "Day12", subTitle: "Flash Animation", viewController: Day12ViewController()),
        Model(name: "Day13", subTitle: "UIDynamicAnimation2", viewController: Day13ViewController()),
        Model(name: "Day14", subTitle: "Facebook pop", viewController: Day14ViewController()),
        Model(name: "Day15", subTitle: "CATransaction", viewController: Day15ViewController()),
        Model(name: "Day16", subTitle: "CADisplaylink - UILabel count animation", viewController: Day16ViewController()),
        Model(name: "Day17", subTitle: "CAEmitterLayer", viewController: Day17ViewController()),
        Model(name: "Day18", subTitle: "PresentationController", viewController: Day18ViewController()),
        Model(name: "Day19", subTitle: "Lottie", viewController: Day19ViewController()),
        Model(name: "Day20", subTitle: "LTMorphingLabel", viewController: Day20ViewController()),
        Model(name: "Day21", subTitle: "UILabel Count Animation", viewController: Day21ViewController()),
        Model(name: "Day22", subTitle: "CAShapeLayer Animation", viewController: Day22ViewController()),
        Model(name: "Day23", subTitle: "Floating badge", viewController: Day23ViewController()),
        Model(name: "Day24", subTitle: "", viewController: Day24ViewController()),
        ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Daily iOS Animations"

//        if #available(iOS 11.0, *) {
//            navigationController?.navigationBar.prefersLargeTitles = true
//        }

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }

}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = models[indexPath.row].name
        cell.detailTextLabel?.text = models[indexPath.row].subTitle
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let model = models[indexPath.row]
        let vc = model.viewController
        vc.title = model.name
        vc.navigationItem.prompt = model.subTitle
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
    }
}
