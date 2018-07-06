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
    let identifier: String
}

class ViewController: UIViewController {

    let tableView = UITableView()
    
    let models: [Model] = [
        Model(name: "Day1", identifier: String(describing: Day1ViewController.self))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Daily iOS Animations"

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
        let storyboard = UIStoryboard(name: model.identifier, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: model.identifier)
        vc.title = model.name
        self.navigationController?.pushViewController(vc, animated: true)

        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
    }
}
