//
//  DetailViewController.swift
//  CSE335FinalProject
//
//  Created by  on 4/23/22.
//

import UIKit
import MapKit
class DetailViewController: UIViewController {

    @IBOutlet weak var selectedDateNumber: UINavigationItem!
    var dateNumber:Int?
    var selectedImage:String?
    var selectedTitle:String?
    var selectedDes:String?
    var selectedLocation:String?
    @IBOutlet weak var dateIdeaIMG: UIImageView!
    @IBOutlet weak var selectedMap: MKMapView!
    @IBOutlet weak var dateIdeaTitle: UILabel!
    @IBOutlet weak var dateIdeaDes: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateIdeaIMG.image = UIImage(named: selectedImage!)
        self.dateIdeaTitle.text = selectedTitle
        self.dateIdeaDes.text = selectedDes
        //self.selectedDateNumber.title = "Date Idea #\(dateNumber!)"
        
        let geoCoder = CLGeocoder()
        
        CLGeocoder().geocodeAddressString(selectedLocation!,
                                          completionHandler:
                                            {(placemarks, error) in
            if error != nil{
                print("Geocode failed: \(error!.localizedDescription)")
            }
            else if placemarks!.count > 0{
            
                let placemark = placemarks![0]
                
                let location = placemark.location
                let coords = location!.coordinate
                
                let longitude = coords.longitude
                let lat = coords.latitude
            
                let span = MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05)
                let region = MKCoordinateRegion(center: placemark.location!.coordinate, span: span)
                self.selectedMap.setRegion(region, animated: true)
                let ani = MKPointAnnotation()
                ani.coordinate = placemark.location!.coordinate
                ani.title = placemark.locality
                ani.subtitle = placemark.subLocality
                self.selectedMap.addAnnotation(ani)
            
            }
            
        })
    }
    

}
