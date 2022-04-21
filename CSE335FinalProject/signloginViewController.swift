//
//  signloginViewController.swift
//  CSE335FinalProject
//
//  Created by  on 4/20/22.
//

import UIKit

class signloginViewController: UIViewController {

    
    @IBOutlet weak var signloginHeader: UILabel!
    var signloginButtonTitle:String?
    
    @IBOutlet weak var signloginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //set the button text on load
        signloginButton.titleLabel?.text
        = signloginButtonTitle
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
