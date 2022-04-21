//
//  signloginViewController.swift
//  CSE335FinalProject
//
//  Created by  on 4/20/22.
//

import UIKit

class signloginViewController: UIViewController {
   
    @IBOutlet weak var signinUsername: UITextField!
    @IBOutlet weak var signinPass: UITextField!
    //Signs the user up to firebase after verification
    @IBAction func signUpAction(_ sender: Any) {
        //check if username is in firebase or not
        if (checkUser(inputUser: signinUsername.text!)){
         //error message
        }
        else{ //add user into firebase, set default objects
            
        }
    }
    
    //if user is in firebase return true, else false
    func checkUser(inputUser:String)->Bool{
        
        return false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hides password
        signinPass.isSecureTextEntry = true

    }
    
    
}
