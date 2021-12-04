//
//  TextEntryViewController.swift
//  PassDataBetweenVCs
//
//  Created by Clara Guo on 2021-12-02.
//

import UIKit

class TextEntryViewController: UIViewController {
    
    private let field: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Name..."
        field.backgroundColor = .white
        field.textColor = .black
        return field
    }()
    
    /// Create an optional closure/completion handler to pass user input text back
    public var completion: ((String?) -> Void)?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Entry Name"
        view.backgroundColor = .lightGray
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDoneButton))
        view.addSubview(field)
        field.frame = CGRect(x: 20, y: 100, width: view.frame.size.width - 40, height: 55)
        /// Note: we need to make this VC the first responder, so that when it's loaded, the cursor will move to the text box automatically
        field.becomeFirstResponder()
    }
    
    @objc private func didTapDoneButton() {
        completion?(field.text)
        
        /// Close  VC when click on Done Button
        dismiss(animated: true, completion: nil)
    }
    

}
