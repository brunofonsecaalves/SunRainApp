//
//  ViewController.swift
//  SunRain
//
//  Created by Bruno Alves on 25/01/21.
//

import UIKit
import CLTypingLabel

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: CLTypingLabel!
    
    override func viewWillAppear(_ animated: Bool) {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "SunRain App."
    }

    @IBAction func discoveryPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToDay", sender: self)
    }
    
}

