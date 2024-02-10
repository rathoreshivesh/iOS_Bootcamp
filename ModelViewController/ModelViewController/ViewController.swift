//
//  ViewController.swift
//  ModelViewController
//
//  Created by user2 on 23/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PetLegs: UILabel!
    @IBOutlet weak var PetName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pets = Dog()
        pets.name = "Jupiter"
        pets.legs = 4
        
        PetName.text = pets.name!
        PetLegs.text = "\(pets.legs!)"
    }


}

