//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var secondsPassed = 0
    var totalTime = 0
    let eggTimes =
    ["Soft" : 5, "Medium" : 5, "Hard" : 5]
    var player : AVAudioPlayer!
    var timer = Timer()
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
    
    @IBOutlet weak var firstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton)
    {
        timer.invalidate()
        let hardness = sender.currentTitle!
        let eggSeconds = eggTimes[hardness]!
        totalTime = eggSeconds
        secondsPassed = 0
        progressView.progress = 0.0
        firstLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector:#selector(updateTimer), userInfo:nil, repeats:true)
        
    }
    @objc func updateTimer()
    {
        if secondsPassed < totalTime
        {
            secondsPassed += 1
            progressView.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
            
            
        }
        if progressView.progress == 1.0
        {
            firstLabel.text = "Done, Enjoy 😋"
            playSound()
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
