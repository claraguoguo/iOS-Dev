//
//  SecondCustomViewController.swift
//  PassDataBetweenVCs
//
//  Created by Clara Guo on 2021-12-01.
//

import UIKit

class SecondCustomViewController: UIViewController {
    
    private let selectedItem: String
    private let relatedItems: [String]
    
    init(selectedItem: String, relatedItems: [String]) {
        self.selectedItem = selectedItem
        self.relatedItems = relatedItems
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedItem.uppercased()
        view.backgroundColor = .systemGray
        
        let label = UILabel(frame: view.bounds)
        view.addSubview(label)
        label.textAlignment = .center
        label.numberOfLines = -1
        for item in relatedItems {
            label.text = (label.text ?? "") + " :) " + item
        }
    }
}
