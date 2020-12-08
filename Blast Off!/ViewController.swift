//
//  ViewController.swift
//  Blast Off!
//
//  Created by Erin Scully on 12/8/20.
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var darkBlueBackground: UIImageView!
    
    @IBOutlet weak var cloudContainerView: UIView!
    
    @IBOutlet weak var rocketImage: UIImageView!
    
    @IBOutlet weak var blastOffLabel: UILabel!
    
    @IBOutlet weak var powerButton: UIButton!
    

    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        guard let filePath = Bundle.main.path(forResource: "hustle-on", ofType: "wav") else {return}
        let urlToFilePath = URL(fileURLWithPath: filePath)
        do {
            player = try AVAudioPlayer(contentsOf: urlToFilePath)
            player?.prepareToPlay()
            
            
        } catch let error as NSError {
            
            print("Error preparing audio player due to: \(error.localizedDescription)")
        }
        
    }

    @IBAction func powerButtonPressed(_ sender: UIButton) {
        cloudContainerView.isHidden = false
        darkBlueBackground.isHidden = true
        powerButton.isHidden = true 
        
        // over the course of 2.3 seconds, animate the rocket image so that it stops at a position that is 150 px from the top of the device
        UIView.animate(withDuration: 2.3) {
            self.rocketImage.frame = CGRect(x: 0, y: 30, width: 414, height: 768)
            self.player!.play()
            
        } completion: { (complete) in
           
            self.blastOffLabel.isHidden = false
        
        }

        
    }
    
}

