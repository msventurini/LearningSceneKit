//
//  ViewController.swift
//  TECNOTinder
//
//  Created by Matheus Silveira Venturini on 01/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwdField: UITextField!
    
    
    @IBAction func emailLoginButton(_ sender: UIButton) {
        
        if (emailField.hasText && passwdField.hasText) {
            print("Logou")
        }
        
    }
    
    
    @IBAction func appleLoginButton(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    
}

