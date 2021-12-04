//
//  ViewController.swift
//  PassDataBetweenVCs
//
//  Created by Clara Guo on 2021-12-01.
//

import UIKit

/*
 1. Custom init
 2. Completion handler (closure)
 3. NotificationCenter post
 */

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        return table
        
    }()
    
    private let data = [
        ["Apple", "sony", "google", "microsoft"],
        ["one", "two", "three", "four"],
        ["China", "Canada", "USA", "UK"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let items = data[indexPath.section]
        let vc = SecondCustomViewController(selectedItem: items[indexPath.row], relatedItems: items)
        present(UINavigationController(rootViewController: vc), animated: true)
    }
}

