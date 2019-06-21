//
//  ViewController.swift
//  Alamofire-Practice
//
//  Created by reiji kobayashi on 2019/06/21.
//  Copyright © 2019 reud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var outputLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLabel.text = "Swift Test"
        button.setTitle("button title", for: UIControl.State.normal)
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func buttonPushedEvent(_ sender: Any) {
        count += 1
        if (count%2 == 0 ) {
            outputLabel.text = "Swift Test"
        }
        else {
            outputLabel.text = "tapped !"
        }
    }
}

