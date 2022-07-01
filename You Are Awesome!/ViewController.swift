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
    var currentMessageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "Click \"Show Message\""
    }
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        print("Button was pressed")
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Da Bomb!",
                        "You are Fantastic",
                        "Fabulous? That's You!"]
        messageLabel.text = messages[currentMessageIndex]
        imageView.image = UIImage(named: "image\(currentMessageIndex)")
        
        currentMessageIndex += 1
        if (currentMessageIndex == messages.count ) {
            currentMessageIndex = 0
        }
        
        
        
//        let awesomeMessage = "You Are Awesome!"
//        let greatMessage = "You Are Great!"
//
//        if messageLabel.text == awesomeMessage {
//            messageLabel.text = greatMessage
//            imageView.image = UIImage(named: "image2")
//        } else if messageLabel.text == greatMessage {
//            messageLabel.text = "You Are Da Bomb!"
//            imageView.image = UIImage(named: "image1")
//
//        } else {
//            messageLabel.text = awesomeMessage
//            imageView.image = UIImage(named: "image0")
//        }
        imageView.isHidden = false
        
    }
    
}
