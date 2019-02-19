//
//  ParticlesExampleUITests.swift
//  ParticlesExampleUITests
//
//  Created by Ryu Blockchain Technologies, Inc on 2/7/9.
//  Copyright © 2019 Ryu Blockchain Technologies, Inc. All rights reserved.
//

import XCTest

class ParticlesExampleUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBasicDisplay() {
        app.buttons["Density"].tap()
        XCTAssertNotNil(app.otherElements["ParticlesView"])
        app.buttons["Background Color"].tap()
        XCTAssertNotNil(app.otherElements["ParticlesView"])
        app.buttons["Particle Color"].tap()
        XCTAssertNotNil(app.otherElements["ParticlesView"])
        app.buttons["D + BG"].tap()
        XCTAssertNotNil(app.otherElements["ParticlesView"])
        app.buttons["BG + PC"].tap()
        XCTAssertNotNil(app.otherElements["ParticlesView"])
        app.buttons["D + PC"].tap()
        XCTAssertNotNil(app.otherElements["ParticlesView"])
        app.buttons["Quick"].tap()
        XCTAssertNotNil(app.otherElements["ParticlesView"])
        app.buttons["Normal"].tap()
        XCTAssertNotNil(app.otherElements["ParticlesView"])
        app.buttons["Slow"].tap()
        XCTAssertNotNil(app.otherElements["ParticlesView"])
    }
}
