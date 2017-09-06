

import UIKit
import AVKit
import AVFoundation



class VideoPlayerViewController: UIViewController,UITextFieldDelegate {
    
   
    var videoPlayItem: AVPlayerItem?
    let avPlayer = AVPlayer()
    let avPlayerLayer = AVPlayerLayer()
    var playButton: UIButton?
    var muteButton: UIButton?
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.black
        setPlayButton()
        setMuteButton()
        setURLTextField()

        avPlayer.addObserver(self, forKeyPath: "volume", options: .new, context: nil)
        avPlayer.addObserver(self, forKeyPath: "rate", options: .new, context: nil)
        
        
            }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "rate" {
            if let rate = change?[NSKeyValueChangeKey.newKey] as? Float {
                if rate != 0.0 {
                    playButton?.setTitle("pause", for: .normal)
                
                }
                else {
                    playButton?.setTitle("play", for: .normal)

                }
            }
        }
        if keyPath == "volume" {
            
            
            if let isMuted = change?[NSKeyValueChangeKey.newKey] as? Float {
                if isMuted == 0.0  {
                    muteButton?.setTitle("unMute", for: .normal)
                    
                }
                else {
                    muteButton?.setTitle("mute", for: .normal)
                    
                }
            }

        
        }
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    func setPlayButton() {
     playButton = UIButton(frame: CGRect(x: 0.0, y: self.view.frame.size.height-60.0, width: 60.0, height: 60.0))
        playButton?.setTitle("play", for: .normal)
        self.view.addSubview(playButton!)
        playButton?.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        
    
    }
    func playButtonAction(sender: UIButton) {
        if let title = sender.titleLabel?.text  {
            if title == "pause" {
            avPlayer.pause()
            }
            else {
            avPlayer.play()
            }
            
            
        }
       

    }
    
    func setMuteButton() {
        muteButton = UIButton(frame: CGRect(x: self.view.frame.size.width-80.0, y: self.view.frame.size.height-60.0, width: 80.0, height: 60.0))
        muteButton?.setTitle("mute", for: .normal)
        muteButton?.addTarget(self, action: #selector(muteButtonAction), for: .touchUpInside)
        
        self.view.addSubview(muteButton!)
    }
    
    func muteButtonAction(sender: UIButton) {
        if let title = sender.titleLabel?.text  {
            if title == "mute" {
                
                avPlayer.volume = 0
            }
            else {
                avPlayer.volume = 3
            }
            
            
        }

    }
    
    func setURLTextField() {
        let urlTextField = UITextField(frame: CGRect(x: 8.0, y: 27.0, width: 359.0, height: 30.0))
        urlTextField.placeholder = "Enter URL of video"
        urlTextField.textAlignment = .center
        urlTextField.backgroundColor = UIColor.white
        urlTextField.delegate = self
        urlTextField.addTarget(self, action: #selector(textFieldDidEnd(textField:)), for: .editingDidEnd)
        self.view.addSubview(urlTextField)
        
    }
    func textFieldDidEnd(textField: UITextField) {
        if let url = textField.text, let videoURL = URL(string: url) {
        setAVPlayer(url: videoURL)
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    func setAVPlayer(url: URL) {
        self.videoPlayItem = AVPlayerItem(url: url)
        avPlayer.replaceCurrentItem(with: videoPlayItem)
        avPlayerLayer.player = avPlayer
        avPlayerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(avPlayerLayer)
        avPlayer.play()
    
    }


}

