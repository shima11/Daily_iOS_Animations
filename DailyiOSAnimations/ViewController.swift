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
    let viewController: UIViewController
}

class ViewController: UIViewController {

    let tableView = UITableView()
    
    let models: [Model] = [
        Model(name: "Day1", viewController: Day1ViewController()),
        Model(name: "Day2", viewController: Day2ViewController()),
        Model(name: "Day3", viewController: Day3ViewController()),
        Model(name: "Day4", viewController: Day4ViewController()),
        Model(name: "Day5", viewController: Day5ViewController()),
        Model(name: "Day6", viewController: Day6ViewController()),
        Model(name: "Day7", viewController: Day7ViewController()),
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].name
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
        self.navigationController?.pushViewController(vc, animated: true)

        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
    }
}
