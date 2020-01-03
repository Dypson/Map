//
//  ViewController.swift
//  Uber_Clone
//
//  Created by Deepson Khadka on 1/1/20.
//  Copyright © 2020 Deepson. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuth
class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var riderLabel: UILabel!
    @IBOutlet weak var driverLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var riderDriverSwitch: UISwitch!
    
    var signUpMode = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func topButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func downButtonTapped(_ sender: Any) {
        switchObjects()
    }
    
    
    func labelSwitch(isHidden: Bool){
        riderLabel.isHidden=isHidden
        driverLabel.isHidden=isHidden
        riderDriverSwitch.isHidden=isHidden
    }
    
    func switchObjects(){
        if signUpMode {
            downButton.setTitle("Switch to Sign up", for: .normal)
            topButton.setTitle("Log in", for: .normal)
            labelSwitch(isHidden: true)
            signUpMode=false
        }else{
            downButton.setTitle("Switch to Log in", for: .normal)
            topButton.setTitle("Sign up", for: .normal)
            labelSwitch(isHidden: false)
            signUpMode=true
        }
    }
}

