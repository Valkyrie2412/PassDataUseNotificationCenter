//
//  ViewController.swift
//  PassDataUseNotificationCenter
//
//  Created by Hiếu Nguyễn on 7/20/18.
//  Copyright © 2018 Hiếu Nguyễn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var data: String?
   
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if data != nil {
            nameTextField.text = data
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveData(_ sender: UIButton) {
        if nameTextField.text != nil {
//            NotificationCenter.default.post(name: NotificationKeys.passCity, object: nil, userInfo: ["city": nameTextField.text!, "age": ageTextField.text!])
            NotificationCenter.default.post(name: NotificationKeys.passCity, object: nameTextField.text)
            navigationController?.popViewController(animated: true)
        }
     }
}

