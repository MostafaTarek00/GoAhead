//
//  SplashViewController.swift
//  GoAhead
//
//  Created by Ali Mohamed on 5/18/20.
//  Copyright © 2020 Maged. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class SplashViewController: UIViewController {
    
    var player: AVPlayer?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()
    }
    
    private func playVideo() {
        //this line is important to prevent background music stop
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
        } catch { }
        
        let path = Bundle.main.path(forResource: "Splash", ofType:"mp4")
        
        player = AVPlayer(url: NSURL(fileURLWithPath: path!) as URL)
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerLayer.zPosition = -1
        
        self.view.layer.addSublayer(playerLayer)
        
        player?.play()
        goToLogin()
        
    }
    
    func goToLogin(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            [weak self] in
            
            if  UserDefault.getcheckLogin() == true {
                if let vc = self?.storyboard?.instantiateViewController(withIdentifier: "TabBar") as? LoginViewController {
                    vc.modalPresentationStyle = .overFullScreen
                    self?.present(vc, animated: true)
                }
            } else {
                if let vc = self?.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
                    vc.modalPresentationStyle = .overFullScreen
                    self?.present(vc, animated: true)
                }
            }
            
        }
    }
}
