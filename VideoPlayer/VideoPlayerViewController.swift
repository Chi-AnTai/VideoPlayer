

import UIKit
import AVKit
import AVFoundation

class VideoPlayerViewController: UIViewController {
    
    override func viewDidLoad() {
//        super.viewDidLoad()
//        let videoURL = URL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")
//        let avplayer = AVPlayer(url: videoURL!)
//        let avplayerLayer = AVPlayerLayer(player: avplayer)
//        avplayerLayer.frame = self.view.bounds
//        self.view.layer.addSublayer(avplayerLayer)
        
        self.view.backgroundColor = UIColor.red
        setPlayButton()
        setMuteButton()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    func setPlayButton() {
    let playButton = UIButton(frame: CGRect(x: 0.0, y: self.view.frame.size.height-60.0, width: 60.0, height: 60.0))
        playButton.setTitle("play", for: .normal)
        self.view.addSubview(playButton)
        
    
    }
    func setMuteButton() {
        let muteButton = UIButton(frame: CGRect(x: self.view.frame.size.width-60.0, y: self.view.frame.size.height-60.0, width: 60.0, height: 60.0))
        muteButton.setTitle("mute", for: .normal)
        
        self.view.addSubview(muteButton)
        

    }


}

