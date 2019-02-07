//
//  Particles.swift
//
//  Created by Wyatt Mufson on 2/7/19.
//

import UIKit

private struct Particle {
    var position: CGPoint
    var speed : CGPoint
}

public enum ParticleDensity: CGFloat {
    case minimum = 1
    case light = 100
    case normal = 500
    case heavy = 1000
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

    public var density: ParticleDensity = .minimum {
        didSet {
            setNeedsLayout()
        }
    }

    @objc func update(){
        setNeedsDisplay()
    }

    convenience init(frame: CGRect, bgColor: UIColor, particlesColor: UIColor, density: ParticleDensity) {
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
        displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.default)
    }

    private func setBackground(ctx: CGContext, rect: CGRect) {
        if bgColor != .clear {
            ctx.setFillColor(bgColor.cgColor)
            ctx.fill(rect)
        } else {
            backgroundColor = bgColor
        }
    }

    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        let ctx = UIGraphicsGetCurrentContext()!
        setBackground(ctx: ctx, rect: rect)

        let count = particles.count
        for i in 0..<count {
            var particle = particles[i]
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
            while (j > i ){
                let particle2 = particles[j]
                let dist = hypot(particle.position.x - particle2.position.x, particle.position.y - particle2.position.y)
                if (dist < 100) {
                    ctx.setAlpha(1 - (dist > 100 ? 0.8 : dist / 150))
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
