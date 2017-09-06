

import UIKit
import AVKit
import AVFoundation

class KVOTest: NSObject {
    dynamic var isPlaying = false
    dynamic var isMuted = false
}


class VideoPlayerViewController: UIViewController,UITextFieldDelegate {
    
    var kvoTest = KVOTest()
    
    override func viewDidLoad() {
//        super.viewDidLoad()
//        let videoURL = URL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")
//        let avplayer = AVPlayer(url: videoURL!)
//        let avplayerLayer = AVPlayerLayer(player: avplayer)
//        avplayerLayer.frame = self.view.bounds
//        self.view.layer.addSublayer(avplayerLayer)
        
        self.view.backgroundColor = UIColor.black
        setPlayButton()
        setMuteButton()
        setURLTextField()
        kvoTest.addObserver(self, forKeyPath: "isPlaying", options: .new, context: nil)
        kvoTest.addObserver(self, forKeyPath: "isMuted", options: .new, context: nil)
            }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "isPlaying" {
            if let isplaying = change?[NSKeyValueChangeKey.newKey] as? Bool {
                if isplaying {
                print("play")
                }
                else {
                print("stop play")
                }
            }
        }
        if keyPath == "isMuted" {
        print("muted")
        }
        
        
        
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    func setPlayButton() {
    let playButton = UIButton(frame: CGRect(x: 0.0, y: self.view.frame.size.height-60.0, width: 60.0, height: 60.0))
        playButton.setTitle("play", for: .normal)
        self.view.addSubview(playButton)
        playButton.addTarget(self, action: #selector(playButtonAction), for: .touchUpInside)
        
    
    }
    func playButtonAction(sender: UIButton) {
        if kvoTest.isPlaying == false {
    kvoTest.isPlaying = true
        }
        else  {
            kvoTest.isPlaying = false
        }
    }
    
    func setMuteButton() {
        let muteButton = UIButton(frame: CGRect(x: self.view.frame.size.width-60.0, y: self.view.frame.size.height-60.0, width: 60.0, height: 60.0))
        muteButton.setTitle("mute", for: .normal)
        muteButton.addTarget(self, action: #selector(muteButtonAction), for: .touchUpInside)
        
        self.view.addSubview(muteButton)
    }
    
    func muteButtonAction(sender: UIButton) {
        if kvoTest.isMuted == false {
            kvoTest.isMuted = true
        }
        else  {
            kvoTest.isMuted = false
        }
    }
    
    func setURLTextField() {
        let urlTextField = UITextField(frame: CGRect(x: 8.0, y: 27.0, width: 359.0, height: 30.0))
        urlTextField.backgroundColor = UIColor.white
        urlTextField.delegate = self
        urlTextField.addTarget(self, action: #selector(textFieldDidEnd(textField:)), for: .editingDidEnd)
        self.view.addSubview(urlTextField)
        
    }
    func textFieldDidEnd(textField: UITextField) {
                let videoURL = URL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")
                let avplayer = AVPlayer(url: videoURL!)
                let avplayerLayer = AVPlayerLayer(player: avplayer)
                avplayerLayer.frame = self.view.bounds
                self.view.layer.addSublayer(avplayerLayer)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }


}

