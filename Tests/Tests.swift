//
//  Tests.swift
//  Particles_Tests
//
//  Created by Ryu Blockchain Technologies, Inc on 2/7/9.
//  Copyright © 2019 Ryu Blockchain Technologies, Inc. All rights reserved.
//

import XCTest

class Tests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testIntialize() {
        let frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        let bgColor : UIColor = .black
        let particlesColor : UIColor = .red
        let density : ParticleDensity = .extraDense
        let speed : ParticleSpeed = .quick
        let p = ParticlesView(frame: frame, bgColor: bgColor, particlesColor: particlesColor, density: density, speed: speed)
        let f = p.frame
        let b = p.bgColor
        let c = p.particlesColor
        let d = p.density
        let s = p.speed
        XCTAssertEqual(f, frame)
        XCTAssertEqual(b, bgColor)
        XCTAssertEqual(c, particlesColor)
        XCTAssertEqual(d, density)
        XCTAssertEqual(s, speed)
        XCTAssertNotNil(p)
    }
}
