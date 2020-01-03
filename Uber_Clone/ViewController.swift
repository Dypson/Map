//
//  ViewController.swift
//  Uber_Clone
//
//  Created by Deepson Khadka on 1/1/20.
//  Copyright © 2020 Deepson. All rights reserved.
//

import UIKit
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
        if (emailTextField.text=="" || passwordTextField.text==""){
            displayAlert(title: "Missing Information", message: "Sorry! Our record shows you haven't provided username or password or both")
        }else{
            if let email=emailTextField.text{
                if let password=passwordTextField.text {
                    if signUpMode {
                        //Sign Up
                        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                            if(error != nil){
                                self.displayAlert(title: "Error", message: error!.localizedDescription)
                            }else{
                                print("Sign up Success")
                            }
                        }
                    }else{
                        //Log in
                        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                            if(error != nil){
                                self.displayAlert(title: "Error", message: error!.localizedDescription)
                            }else{
                                print("Login Success")
                            }
                            
                        }
                        
                    }
                }
            }
            
        }
    }
    
    func displayAlert(title:String, message:String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
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

