//
//  GenerateIdeaViewController.swift
//  CSE335FinalProject
//
//  Created by  on 4/23/22.
//

import UIKit

class GenerateIdeaViewController: UIViewController {

    var dateIdeas = ["Breakfast", "Lunch", "Dinner"]
    @IBAction func genAction(_ sender: Any) {
        var index = Int.random(in: 0...2 )
        //randomly generate a date idea
        
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
