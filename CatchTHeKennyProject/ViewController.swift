//
//  ViewController.swift
//  CatchTHeKennyProject
//
//  Created by Alperen Kavuk on 21.07.2022.
//

import UIKit

class ViewController: UIViewController {
    var score=0
    var timer=Timer()
    var counter=0
    var hideTimer=Timer()
    var kennyArray=[UIImageView]()
    var highScore=0
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text="score:\(score)"
        
        kenny1.isUserInteractionEnabled=true
        kenny2.isUserInteractionEnabled=true
        kenny3.isUserInteractionEnabled=true
        kenny4.isUserInteractionEnabled=true
        kenny5.isUserInteractionEnabled=true
        kenny6.isUserInteractionEnabled=true
        kenny7.isUserInteractionEnabled=true
        kenny8.isUserInteractionEnabled=true
        kenny9.isUserInteractionEnabled=true
        
        let recognizer1=UIGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2=UIGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3=UIGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4=UIGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5=UIGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6=UIGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7=UIGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8=UIGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9=UIGestureRecognizer(target: self, action: #selector(increaseScore))

        kenny1.addGestureRecognizer(recognizer1)
        kenny2.addGestureRecognizer(recognizer2)
        kenny3.addGestureRecognizer(recognizer3)
        kenny4.addGestureRecognizer(recognizer4)
        kenny5.addGestureRecognizer(recognizer5)
        kenny6.addGestureRecognizer(recognizer6)
        kenny7.addGestureRecognizer(recognizer7)
        kenny8.addGestureRecognizer(recognizer8)
        kenny9.addGestureRecognizer(recognizer9 )
        
        kennyArray=[kenny1,kenny2,kenny3,kenny4,kenny5,kenny6,kenny7,kenny8,kenny9]
        
        counter=10
        timeLabel.text=String(counter)
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer=Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        
        hideKenny()
        
    }
  @objc  func hideKenny(){
        for keny in kennyArray{
            keny.isHidden=true
        }
        let random=Int(arc4random_uniform(UInt32(kennyArray.count-1)))
        kennyArray[random].isHidden=false
    }
    
    @objc func increaseScore(){
        //score +=1
        scoreLabel.text="score: \(score)"
        

}
    @objc func countDown(){
        counter-=1
        timeLabel.text=String(counter)
        if counter==0{
            timer.invalidate()
            hideTimer.invalidate()
            let alert=UIAlertController(title: "Zamanın doldu", message: "yeniden oynamak ister misin?", preferredStyle: UIAlertController.Style.alert)
            let okButton=UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton=UIAlertAction(title: "replay", style: UIAlertAction.Style.default) { UIAlertAction in
                //REPLay
                self.score=0
                self.scoreLabel.text="score\(self.score)"
                self.counter=10
                self.timeLabel.text=String(self.counter)
                self.timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer=Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(self.hideKenny), userInfo: nil, repeats: true)
                
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true)
        }
    }

}
