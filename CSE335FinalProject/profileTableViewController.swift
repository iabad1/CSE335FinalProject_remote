//
//  profileTableViewController.swift
//  CSE335FinalProject
//
//  Created by  on 4/23/22.
//

import UIKit
import Firebase

class profileTableViewController: UITableViewController {

    
    @IBOutlet var dateTableView: UITableView!
    //model
    var dateIdeaList:DateIdeas = DateIdeas() //get the date ideas from the user
    //let viewModel = AppViewModel()
    private let database = Database.database().reference()
    var username:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Successful Sign Up!")
        print(username!)
        
        //user model from firebase
        //var currentUser:NSDictionary?
        //using username, get the user data from firebase
        database.child("users").child("user0").observeSingleEvent(of: .value, with: {snapshot in
            let value = snapshot.value as? NSDictionary
            //currentUser = value!
            let username = value?["username"] as? String ?? ""
            //let username = value["username"]
            print("Username: \(username)")
            
            //create new user class
            
        })
        
        //store current user objects into a class
        
         
        
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dateIdeaList.getCount()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dateIdeaCell", for: indexPath) as! DateTableViewCell

        // Configure the cell...
        let dateItem = dateIdeaList.getDateObject(item: indexPath.row)
        
        cell.cellTitle.text = dateItem.title
        cell.cellImage.image = UIImage(named: dateItem.thumbnail!)
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt fromIndexPath: IndexPath)-> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.delete
    }
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        dateIdeaList.removeDateObject(item: indexPath.row)
        self.dateTableView.beginUpdates()
        self.dateTableView.deleteRows(at: [indexPath], with: .automatic)
        self.dateTableView.endUpdates()
        
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        //randomly generate a date idea
        let title = ["Breakfast", "Lunch", "Dinner"]
        let index = Int.random(in: 0...2)
        let selectedDate = title[index]
        
        let loc = ["Tempe", "Mesa", "Chandler"]
        let indexLoc = Int.random(in:0...2)
        let selectedLoc = loc[indexLoc]
        
        self.dateIdeaList.addDateIdea(title: selectedDate, description: "Get some \(selectedDate) with your loved one at \(selectedLoc)!", location: selectedLoc, thumbnail: "heart_full.png")
        let indexPath = IndexPath(row: self.dateIdeaList.getCount() - 1, section: 0)
        self.dateTableView.beginUpdates()
        self.dateTableView.insertRows(at: [indexPath], with: .automatic)
        self.dateTableView.endUpdates()
           
        
    }
    //going into detailed view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let selectedIndex: IndexPath = self.dateTableView.indexPath(for: sender as! UITableViewCell)!
        let dateIdea = dateIdeaList.getDateObject(item: selectedIndex.row)
        let viewController: DetailViewController = segue.destination as! DetailViewController
        
        if(segue.identifier == "toDetailView"){
            //passing the data into the detail view
            viewController.selectedTitle = dateIdea.title
            viewController.selectedDes = dateIdea.description
            viewController.selectedImage = dateIdea.thumbnail
            viewController.selectedLocation = dateIdea.location
            //viewController.selectedDateNumber = selectedIndex.row
        }
        
        
        
    }
    

}
