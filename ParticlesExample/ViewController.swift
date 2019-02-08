//
//  ViewController.swift
//  ParticlesExample
//
//  Created by Ryu Blockchain Technologies, Inc on 2/7/9.
//  Copyright © 2019 Ryu Blockchain Technologies, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var p : ParticlesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .black
        p = ParticlesView(frame: view.frame, particlesColor: .white, density: .dense)
        p.accessibilityIdentifier = "ParticlesView"
        view.addSubview(p)
        view.sendSubviewToBack(p)
    }

    @IBAction func densityTest(_ sender: Any) {
        p.density = .light
    }
    
    @IBAction func bgTest(_ sender: Any) {
        p.bgColor = .yellow
    }
    
    @IBAction func pTest(_ sender: Any) {
        p.particlesColor = .green
    }
    
    @IBAction func densityBGTest(_ sender: Any) {
        p.density = .normal
        p.bgColor = .orange
    }
    
    @IBAction func bgPTest(_ sender: Any) {
        p.bgColor = .blue
        p.particlesColor = .red
    }
    
    @IBAction func densityPTest(_ sender: Any) {
        p.density = .extraDense
        p.particlesColor = .darkGray
    }

    @IBAction func quickTest(_ sender: Any) {
        p.speed = .quick
    }

    @IBAction func normalSpeedTest(_ sender: Any) {
        p.speed = .normal
    }

    @IBAction func slowTest(_ sender: Any) {
        p.speed = .slow
    }
}
