//
//  signloginViewController.swift
//  CSE335FinalProject
//
//  Created by  on 4/20/22.
//

import UIKit
import FirebaseAuth
import Firebase
import SwiftUI

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
            return
        }
        else{
            guard !signinEmail.text!.isEmpty, !signinPass.text!.isEmpty else{
                signinErrMSG.text = "Empty Fields. Try Again."
                return
            }
            viewModel.signup(email: signinEmail.text!, password: signinPass.text!)
            
            //once signed up, store the user in the database and initialize their profile using user class which will be implemented soon
            
            viewModel.signedIn = viewModel.isSignedIn
            
            if(!viewModel.isSignedIn){
                signinErrMSG.text = "Invalid Email or Username. Try Again."
            }
            else{
                
            }
           
        }
        
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let des = segue.destination as! profileTableViewController
        if (segue.identifier == "toProfileView"){
            des.username = signinUsername.text
        }
    }
    //if user is in firebase return true, else false
    func checkUser(inputUser:String)->Bool{
        var users: [String] = []
        let database = Database.database().reference()
        
        
        database.child("users").child("user0").observe(.value, with: {snapshot in
           
            //for j in 0 ... snapshot.childrenCount{
                let value = snapshot.value as? NSDictionary
                let username = value?["username"] as? String ?? ""
                //let username = value["username"]
                
                print("Username: \(username)")
                users.append(username)
                
           // }
            
            
        })
        
        if users.contains(inputUser){
            print("Contains the same user!!")
            return true
        }
        else{
            print("Does not contain the same user!!")
            return false
            
        }
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hides password
        signinPass.isSecureTextEntry = true
        signinErrMSG.text = ""

    }
    
    
    
    
}
