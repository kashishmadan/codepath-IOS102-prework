//
//  ViewController.swift
//  ios102prework
//
//  Created by Kashish Madan on 11/20/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var favouriteEmoji: UITextField!
    @IBOutlet weak var colourPicker: UIColorWell!
    @IBOutlet weak var backgroundColor: UILabel!
    @IBOutlet weak var introduceSelfButton: UIButton!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var changePetsCount: UIStepper!
    @IBOutlet weak var academicYear: UISegmentedControl!
    @IBOutlet weak var petsCount: UILabel!
    @IBOutlet weak var schoolName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        firstName.text = "Hello"
        firstName.text = defaults.string(forKey: "FirstName")
        lastName.text = defaults.string(forKey: "LastName")
        schoolName.text = defaults.string(forKey: "SchoolName")
        academicYear.selectedSegmentIndex = defaults.integer(forKey: "Year")
        if(defaults.string(forKey: "PetsCount")==nil) {
            defaults.set("0", forKey: "PetsCount")
            changePetsCount.value = 0
        }
        petsCount.text = defaults.string(forKey: "PetsCount")
        changePetsCount.value = Double(0 + Int(petsCount.text!)!)
        morePetsSwitch.isOn = defaults.bool(forKey: "MorePetsSwitch")
        favouriteEmoji.text = defaults.string(forKey: "FavouriteEmoji")
    }
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        petsCount.text = "\(Int(sender.value))"
   }
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        let year = academicYear.titleForSegment(at: academicYear.selectedSegmentIndex)
        let introduction = "My name is \(firstName.text!) \(lastName.text!) and I attend \(schoolName.text!). I am currently in my \(year!) year and I own \(petsCount.text!) dogs. It is \(morePetsSwitch.isOn) that I want more pets. My favourite emoji is \(favouriteEmoji.text!)"
        let selectedColor = colourPicker.selectedColor
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        alertController.addAction(action)
        alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = selectedColor
        alertController.view.tintColor = UIColor.black
        present(alertController, animated: true, completion: nil)
        
        let defaults = UserDefaults.standard
        defaults.set(firstName.text, forKey: "FirstName")
        defaults.set(lastName.text, forKey: "LastName")
        defaults.set(schoolName.text, forKey: "SchoolName")
        defaults.set(year, forKey: "Year")
        defaults.set(petsCount.text, forKey: "PetsCount")
        defaults.set(morePetsSwitch.isOn, forKey: "MorePetsSwitch")
        defaults.set(favouriteEmoji.text, forKey: "FavouriteEmoji")
   }

}

