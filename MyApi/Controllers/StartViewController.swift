//
//  ViewController.swift
//  MyApi
//
//  Created by ddyack on 21.09.2020.
//

import Spring
import AVFoundation

class StartViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: SpringLabel!
    @IBOutlet weak var button: SpringButton!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runMusic()
        runAnimate()
        
    }
    
    
}

extension StartViewController {
    func runAnimate() {
        titleLabel.animation = Spring.AnimationPreset.SlideUp.rawValue
        titleLabel.duration = 10
        titleLabel.animate()
        
        button.animation = Spring.AnimationPreset.Pop.rawValue
        button.duration = 30
        button.animate()
    }
    
    func runMusic() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "breaking", ofType: "mp3")!))
            audioPlayer.play()
        } catch {
            let error = error
            print(error)
        }
    }
}
