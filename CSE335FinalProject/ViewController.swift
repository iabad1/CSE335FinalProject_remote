//
//  ViewController.swift
//  CSE335FinalProject
//
//  Created by  on 4/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let des = segue.destination as! signloginViewController
        
        //set the header of the next view controller
        if(segue.identifier == "toSignUp"){
            des.signloginHeader.text = "Sign Up"
            des.signloginButtonTitle = "Sign Up"
        }
        else if(segue.identifier == "toLogin"){
            des.signloginHeader.text = "Login"
            des.signloginButtonTitle = "Sign Up"
        }
        
    }
    
    
}

