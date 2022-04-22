//
//  signloginViewController.swift
//  CSE335FinalProject
//
//  Created by  on 4/20/22.
//

import UIKit
import FirebaseAuth

//Sign-In or Login authentication
class AppViewModel: ObservableObject{
    let auth = Auth.auth()
    
    @Published var signedIn = false
    var isSignedIn:Bool{
        return auth.currentUser != nil
    }
    
    func login(email:String, password:String){
        auth.signIn(withEmail: email, password: password){[weak self] result, error in
            //error handling
            guard result != nil, error == nil
            else{
                return
            }
            //Successful login
            DispatchQueue.main.async{
                self?.signedIn = true
            }
        }
    }
    func signup(email:String, password:String){
        auth.createUser(withEmail: email, password: password){ [weak self] result, error in
            //error handling
            guard result != nil, error == nil
            else{
                return
            }
            //Successful login
            DispatchQueue.main.async{
                self?.signedIn = true
            }
        }
        
    }
    
    
    
}

//Content On Click Functions
class signloginViewController: UIViewController {
   
    let viewModel = AppViewModel()
    
    @IBOutlet weak var signinEmail: UITextField!
    @IBOutlet weak var signinPass: UITextField!
    @IBOutlet weak var signinUsername: UITextField!
    @IBOutlet weak var signinErrMSG: UILabel!
    //Signs the user up to firebase after verification
    @IBAction func signUpAction(_ sender: Any) {
        
        //check if the username is in firebase
        if checkUser(inputUser: signinUsername.text!){
            signinErrMSG.text = "Username already exists. Try Again."
        }
        else{
            guard !signinEmail.text!.isEmpty, !signinPass.text!.isEmpty else{
                signinErrMSG.text = "Empty Fields. Try Again."
                return
            }
            viewModel.signup(email: signinEmail.text!, password: signinPass.text!)
            
            //once signed up, store the user in the database and initialize their profile using user class which will be implemented soon
            
            viewModel.signedIn = viewModel.isSignedIn
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
        signinErrMSG.text = ""

    }
    
    
    
    
}
