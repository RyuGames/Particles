//
//  Particles.swift
//
//  Created by Ryu Blockchain Technologies, Inc on 2/7/9.
//  Copyright © 2019 Ryu Blockchain Technologies, Inc. All rights reserved.
//

import UIKit

private class Particle: NSObject {
    var position: CGPoint!
    var speed : CGPoint!
    init(position: CGPoint, speed: CGPoint) {
        super.init()
        self.position = position
        self.speed = speed
    }
}

public enum ParticleDensity: CGFloat {
    case extraLight = 7000
    case light = 6000
    case normal = 5000
    case dense = 3000
    case extraDense = 2000
}

public class ParticlesView: UIView {
    fileprivate var particles: [Particle] = []

    public var bgColor: UIColor = .clear {
        didSet {
            setNeedsLayout()
        }
    }

    public var particlesColor: UIColor = .white {
        didSet {
            setNeedsLayout()
        }
    }

    public var density: ParticleDensity = .extraLight {
        didSet {
            setNeedsLayout()
        }
    }

    @objc func update(){
        setNeedsDisplay()
    }

    convenience init(frame: CGRect, bgColor: UIColor = .clear, particlesColor: UIColor = .black, density: ParticleDensity = .extraLight) {
        self.init(frame: frame)
        self.bgColor = bgColor
        self.particlesColor = particlesColor
        self.density = density
    }

    private func randomValue () -> CGFloat {
        let upperBound : UInt32 = 1000
        return (CGFloat(arc4random_uniform(upperBound))) / CGFloat(upperBound);
    }

    override public func didMoveToSuperview() {
        super.didMoveToSuperview()
        clearsContextBeforeDrawing = true
        contentMode = .redraw
        clipsToBounds = false

        let totalSize: CGFloat = bounds.width * bounds.height
        let particleCount: Int = Int(totalSize / density.rawValue)

        for _ in 0..<particleCount {
            let position = CGPoint(x: bounds.width * randomValue(), y: bounds.height * randomValue())
            let speed = CGPoint(x: randomValue() * 2 - 1, y: randomValue() * 2 - 1)
            let particle = Particle(position: position, speed: speed)
            particles.append(particle)
        }

        let displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: .main, forMode: .default)
    }

    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        let ctx = UIGraphicsGetCurrentContext()!
        if bgColor != .clear {
            ctx.setFillColor(bgColor.cgColor)
            ctx.fill(rect)
        } else {
            backgroundColor = bgColor
        }

        let count = particles.count
        for i in 0..<count {
            let particle = particles[i]
            if (particle.position.x > rect.size.width + 50 || particle.position.x < -50) {
                particle.speed.x = -particle.speed.x;
            }

            if (particle.position.y > rect.size.height + 50 || particle.position.y < -50) {
                particle.speed.y = -particle.speed.y;
            }

            particle.position.x += particle.speed.x;
            particle.position.y += particle.speed.y;

            ctx.beginPath()
            ctx.setFillColor(particlesColor.cgColor)
            ctx.addArc(center: particle.position, radius: 3.0, startAngle: 0, endAngle: .pi * 2, clockwise: false)
            ctx.fillPath()
            ctx.beginPath()
            ctx.setStrokeColor(particlesColor.cgColor)
            var j = count - 1
            while (j > i){
                let particle2 = particles[j]
                let dist = hypot(particle.position.x - particle2.position.x, particle.position.y - particle2.position.y)
                if (dist < 100) {
                    ctx.setAlpha(1 - (dist > 100 ? 0.7 : dist / 150))
                    ctx.setLineWidth(2)
                    ctx.move(to: CGPoint(x: 0.5 + particle.position.x, y: 0.5 + particle.position.y))
                    ctx.addLine(to: CGPoint(x: 0.5 + particle2.position.x, y: 0.5 + particle2.position.y))
                }
                j -= 1
            }
            ctx.strokePath()
        }
    }
}
