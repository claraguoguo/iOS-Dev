//
//  ViewController.swift
//  PassDataBetweenVCs
//
//  Created by Clara Guo on 2021-12-01.
//

import UIKit

/*
 1. Custom init -> ViewController
 2. Completion handler (closure) -> SecondViewController 
 3. NotificationCenter post -> ThirdViewController
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
    
    var observer: NSObjectProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        
        /*
         Have an observer of type: NSObjectProtocol to listen to the Notification with name "myCustom". Once a notificaiton is received, it will be unwrapped and casted into a dictionary of format {String: UIColor} (i.e. ["color": UIColor.red]). The UIColor will be read and set as the background color of current controller. 
         */
        observer = NotificationCenter.default.addObserver(forName: Notification.Name("myCustom"), object: nil, queue: .main, using: { notification in
            
            guard let object = notification.object as? [String: UIColor] else {
                return
            }
            
            guard let color = object["color"] else {
                return
            }
            self.view.backgroundColor = color
            self.tableView.isHidden = true
        })
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

