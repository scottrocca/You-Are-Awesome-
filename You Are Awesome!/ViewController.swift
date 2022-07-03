//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Scott Rocca on 6/30/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var currentImageIndex = -1
    var currentMessageIndex = -1
    let totalNumberOfImages = 9
    var audioPlayer: AVAudioPlayer!
    
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
                        "Fabulous? That's You!",
                        "You've Got the Design Skills of Jony Ive"]
        
        var newMessageIndex: Int
        repeat {
            newMessageIndex = Int.random(in: 0..<messages.count)
        } while newMessageIndex == currentMessageIndex
        currentMessageIndex = newMessageIndex
        messageLabel.text = messages[currentMessageIndex]
        
        var newImageIndex: Int
        repeat {
            newImageIndex = Int.random(in: 0...totalNumberOfImages)
        } while newImageIndex == currentImageIndex
        currentImageIndex = newImageIndex
        imageView.image = UIImage(named: "image\(currentImageIndex)")
        
        if let sound = NSDataAsset(name: "sound0"){
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("😡 ERROR: \(error.localizedDescription) Could not initialize AVAudioPlayer object.")
            }
            
        } else {
            print("😡 ERROR: Could not read data from file sound0")
        }
        
//        var newMessage = messages[Int.random(in: 0...messages.count-1)]
//        while newMessage == messageLabel.text {
//            newMessage = messages[Int.random(in: 0...messages.count-1)]
//        }
//        messageLabel.text = newMessage
//
//
//        var newImage = UIImage(named: "image\(Int.random(in: 0...totalNumberOfImages))")
//        while newImage == imageView.image {
//            newImage = UIImage(named: "image\(Int.random(in: 0...totalNumberOfImages))")
//        }
//        imageView.image = newImage
        
        
//        messageLabel.text = messages[currentMessageIndex]
//        imageView.image = UIImage(named: "image\(currentMessageIndex)")
//
//        currentMessageIndex += 1
//        if (currentMessageIndex == messages.count ) {
//            currentMessageIndex = 0
//        }
//
        
        
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
