//
//  PlayerViewController.swift
//  MLaur
//
//  Created by Леонид Шелудько on 28.11.2022.
//

import UIKit
import AVFoundation



class PlayerViewController: UIViewController {

    @IBOutlet weak var nameTrekLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    
    var player = AVAudioPlayer()
    
    
    var timer: Timer?
    var timeSong: Double = Double()
    
    var updateTrek = "Colorado"
    var updateName = ""
    
    let trek1 = "Colorado"
    let trek2 = "Sterva"
    let trek3 = "leiVino"
    let trek4 = "RokZvezda"
    let trek5 = "GHOST"
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        nameTrekLabel.text! = updateName
        
// Плеер
        playerPlay(namePathTrek: updateTrek)
        
        self.player.play()
        
        
//Продолжительность
        progressSlider.addTarget(self, action: #selector(changeProgress(sender:)), for: .valueChanged)
        
        progressSlider.tintColor = .gray
        progressSlider.setThumbImage(UIImage(systemName: "heart.fill"), for: .normal)
        
        //Создаём таймер с интервалом 1 сек
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
   
    
    
    
//Кнопки
    @IBAction func closeButton(_ sender: Any) {
        self.player.stop()
        dismiss(animated: true)
    }
    @IBAction func backPlayAction(_ sender: Any) {
        switch updateTrek {
        case trek1:
            playerPlay(namePathTrek: trek5);
            updateTrek = trek5;
            nameTrekLabel.text = trek5
        case trek2:
            playerPlay(namePathTrek: trek1);
            updateTrek = trek1
            nameTrekLabel.text = trek1
        case trek3:
            playerPlay(namePathTrek: trek2);
            updateTrek = trek2
            nameTrekLabel.text = trek2
        case trek4:
            playerPlay(namePathTrek: trek3);
            updateTrek = trek3
            nameTrekLabel.text = trek3
        case trek5:
            playerPlay(namePathTrek: trek4);
            updateTrek = trek4
            nameTrekLabel.text = trek4
        default: break
        }
        changedPlayPauseButton()
        self.player.play()
    }
    
    @IBAction func goPlayAction(_ sender: Any) {
        switch updateTrek {
        case trek1:
            playerPlay(namePathTrek: trek2);
            updateTrek = trek2
            nameTrekLabel.text = trek2
        case trek2:
            playerPlay(namePathTrek: trek3);
            updateTrek = trek3
            nameTrekLabel.text = trek3
        case trek3:
            playerPlay(namePathTrek: trek4);
            updateTrek = trek4
            nameTrekLabel.text = trek4
        case trek4:
            playerPlay(namePathTrek: trek5);
            updateTrek = trek5
            nameTrekLabel.text = trek5
        case trek5:
            playerPlay(namePathTrek: trek1);
            updateTrek = trek1
            nameTrekLabel.text = trek1
        default: break
        }
        changedPlayPauseButton()
        self.player.play()
    }
    
    @IBAction func pauseAction(_ sender: UIButton) {
        if player.isPlaying {
            player.pause()
            sender.setImage(UIImage(systemName: "play"), for: .normal)
        } else {
            player.play()
            sender.setImage(UIImage(systemName: "pause"), for: .normal)
        }
    }
    
    @IBAction func shareButton(_ sender: Any) {
        let activitiItem = nameTrekLabel.text
        let shareViewController = UIActivityViewController(activityItems: [activitiItem as Any], applicationActivities: nil)
        shareViewController.popoverPresentationController?.sourceView = self.view
        self.present(shareViewController, animated: true, completion: nil)
    }
    
    
//Звук
    @IBAction func soundAction(_ sender: Any) {
        self.player.volume = self.volumeSlider.value
    }
    
//Продолжительность
    @objc func changeProgress(sender: UISlider) {
        if sender == progressSlider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    
    
    @objc func updateTime() {
        //Время от начала
        let timePlayed = player.currentTime //currentTime - на каком времени песня
            let minutes = Int(timePlayed / 60)
            let seconds = Int(timePlayed.truncatingRemainder(dividingBy: 60))
            startTimeLabel.text = NSString(format: "%002d:%02d", minutes, seconds) as String
        
        //Время до конца
        
        let difftime = player.currentTime - player.duration // duration
        let minutes1 = Int(difftime / 60)
        let seconds1 = Int(-difftime.truncatingRemainder(dividingBy: 60))
        endTimeLabel.text = NSString(format: "%02d:%02d", minutes1, seconds1) as String
        
        //Ползунок двигается вместе с песней
        progressSlider.setValue(Float(self.player.currentTime), animated: true)
    }
    
    
    
    func playerPlay(namePathTrek: String) {
        do{
            if let audioPath = Bundle.main.path(forResource: namePathTrek, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.progressSlider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
    }
    
    func changedPlayPauseButton() {
        if player.isPlaying {
            pauseButton.setImage(UIImage(systemName: "play"), for: .normal)
        } else {
            pauseButton.setImage(UIImage(systemName: "pause"), for: .normal)
        }
    }
}




