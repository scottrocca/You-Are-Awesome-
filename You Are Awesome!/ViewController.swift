//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Scott Rocca on 6/30/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "Click \"Show Message\""
    }

    @IBAction func messageButtonPressed(_ sender: UIButton) {
        print("Button was pressed")
        messageLabel.text = "You Are Awesome!"
        imageView.image = UIImage(named: "image1")
    }
    
}

