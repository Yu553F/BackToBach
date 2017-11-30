//
//  ViewController.swift
//  BachToBack
//
//  Created by Alumno ITESM Toluca on 22/11/17.
//  Copyright © 2017 Alumno ITESM Toluca. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    var cancion: Song?

    @IBOutlet weak var niTitle: UINavigationItem!
    @IBOutlet weak var iCover: UIImageView!
    @IBOutlet weak var sVolumen: UISlider!
    @IBAction func ajustarVolumen(_ sender: Any) {
        player.volume = sVolumen.value
    }
    
    @IBOutlet weak var sScrub: UISlider!
    @IBAction func scrubTimer(_ sender: Any) {
        player.currentTime = TimeInterval(sScrub.value)
    }
    
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    @IBAction func stop(_ sender: Any) {
        do{
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: cancion?.file, ofType:"mp3")!))
        } catch {
            print("Error cargando archivo.")
        }
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event!.subtype == UIEventSubtype.motionShake {
            player.play()
        }
    }
    
    func updateScrubSlider(){
        sScrub.value = Float(player.currentTime)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do{
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: cancion?.file, ofType:"mp3")!))
            sScrub.maximumValue = Float(player.duration)
        } catch {
            print("Error cargando archivo.")
        }
        
        _ = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.updateScrubSlider), userInfo: nil, repeats: true)
        
        guard cancion?.cover != nil else {
            fatalError()
        }
        
        iCover.image = cancion?.cover
        
        niTitle.title = cancion?.nombre
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player.stop()
    }
    


}

