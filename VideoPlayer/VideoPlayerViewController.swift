

import UIKit
import AVKit
import AVFoundation

class VideoPlayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let videoURL = URL(string: "http://devimages.apple.com/iphone/samples/bipbop/bipbopall.m3u8")
        let avplayer = AVPlayer(url: videoURL!)
        let avplayerLayer = AVPlayerLayer(player: avplayer)
        avplayerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(avplayerLayer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}

