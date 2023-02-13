// This project developed with Angela Yu
// Thanks to herself
// This project finished on 13 February 2023

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes = ["Soft":  300, "Medium": 420, "Hard": 720]
    //var secondsRemaining : Float = 0
    var timer = Timer()
    var secondPassed: Float = 0
    var totalTime: Float  = 0
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        

        timer.invalidate() // this code works for the bug(bir sayaci calistirdiktan sonra bor diger butona dokundugunda saniye daha hizli isliyor bunu engelliyor bu kod)
        
        let hardness = sender.currentTitle! //select title
        
        var result: Float = Float(eggTimes[hardness]!)//other assignment
        
        progressView.progress = 0.0
        secondPassed = 0
        titleLabel.text = hardness + " Boiling!!"
        
        totalTime = result //every click for working button
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            (Timer) in
            if (self.secondPassed < self.totalTime) {

                self.secondPassed += 1
                
                let percentageProgress = self.secondPassed / self.totalTime
                
                self.progressView.progress = percentageProgress
                
                print ("\(self.secondPassed) seconds")
                
            }else {
                Timer.invalidate()
                self.titleLabel.text = "DONE!!"
                
                
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            
                self.player = try! AVAudioPlayer(contentsOf: url!)
                self.player.play()//completely being add a sound
            
            }
            
           
        }
        
    
    }
    
}
