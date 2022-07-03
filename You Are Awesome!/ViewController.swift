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
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    var currentImageIndex = -1
    var currentMessageIndex = -1
    var currentSoundIndex = -1
    let totalNumberOfImages = 10
    let totalNumberOfSounds = 6
    var audioPlayer: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = "Click \"Show Message\""
    }
    
    func playSound(name: String) {
        if let sound = NSDataAsset(name: name){
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("😡 ERROR: \(error.localizedDescription) Could not initialize AVAudioPlayer object.")
            }
            
        } else {
            print("😡 ERROR: Could not read data from file sound0")
        }
    }
    
    func nonRepeatingRandom(originalNumber: Int, upperBounds: Int) -> Int {
        var newIndex: Int
        repeat {
            newIndex = Int.random(in: 0...upperBounds)
        } while newIndex == originalNumber
        
        return newIndex
    }
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Da Bomb!",
                        "You are Fantastic",
                        "Fabulous? That's You!",
                        "You've Got the Design Skills of Jony Ive"]
        

        currentMessageIndex = nonRepeatingRandom(originalNumber: currentMessageIndex, upperBounds: messages.count-1)
        messageLabel.text = messages[currentMessageIndex]
        
        currentImageIndex = nonRepeatingRandom(originalNumber: currentImageIndex, upperBounds: totalNumberOfImages-1)
        imageView.image = UIImage(named: "image\(currentImageIndex)")
        if playSoundSwitch.isOn {
            currentSoundIndex = nonRepeatingRandom(originalNumber: currentSoundIndex, upperBounds: totalNumberOfSounds-1 )
            playSound(name: "sound\(currentSoundIndex)")
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
    
    @IBAction func playSoundToggled(_ sender: UISwitch) {
        if !sender.isOn && audioPlayer != nil {
            audioPlayer.stop()
        }
    }
    
    
}
