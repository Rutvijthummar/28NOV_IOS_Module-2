//
//  ViewController.swift
//  M4ASS9
//
//  Created by MAC on 25/05/23.
//  Make an app to open media library like. MP3,mp4 within ui image picker controller.

import UIKit
import AVKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let picker = UIImagePickerController()
    var player:AVPlayer?
       var playerItem:AVPlayerItem?
       var playButton:UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAct(_ sender: Any) {
        
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary) ?? []
        picker.mediaTypes = ["public.movie"]
        
        picker.videoQuality = .typeHigh
        picker.videoExportPreset = AVAssetExportPresetHEVC1920x1080
        
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
        
        //---------------------------
        
        let url = URL(string: "https://s3.amazonaws.com/kargopolov/kukushka.mp3")
            let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
            player = AVPlayer(playerItem: playerItem)
            
            let playerLayer=AVPlayerLayer(player: player!)
            playerLayer.frame=CGRect(x:0, y:0, width:10, height:50)
            self.view.layer.addSublayer(playerLayer)
            
            playButton = UIButton(type: UIButton.ButtonType.system) as UIButton
            let xPostion:CGFloat = 50
            let yPostion:CGFloat = 100
            let buttonWidth:CGFloat = 150
            let buttonHeight:CGFloat = 45
            
            playButton!.frame = CGRect(x: xPostion, y: yPostion, width: buttonWidth, height: buttonHeight)
            playButton!.backgroundColor = UIColor.lightGray
            playButton!.setTitle("Play", for: UIControl.State.normal)
            playButton!.tintColor = UIColor.black
            playButton!.addTarget(self, action: #selector(self.playButtonTapped(_:)), for: .touchUpInside)
            
            self.view.addSubview(playButton!)
        }
    @objc func playButtonTapped(_ sender:UIButton)
    {
        if player?.rate == 0
        {
            player!.play()
            //playButton!.setImage(UIImage(named: "player_control_pause_50px.png"), forState: UIControlState.Normal)
            playButton!.setTitle("Pause", for: UIControl.State.normal)
        } else {
            player!.pause()
            //playButton!.setImage(UIImage(named: "player_control_play_50px.png"), forState: UIControlState.Normal)
            playButton!.setTitle("Play", for: UIControl.State.normal)
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            dismiss(animated: true, completion: nil)
            guard let movieUrl = info[.mediaURL] as? URL else { return }

            // work with the video URL
    }
    
}

