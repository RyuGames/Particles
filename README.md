# Particles

[![Build Status](https://travis-ci.com/Ryucoin/Particles.svg?branch=master)](https://travis-ci.com/Ryucoin/Particles)
[![codecov](https://codecov.io/gh/Ryucoin/Particles/branch/master/graph/badge.svg)](https://codecov.io/gh/Ryucoin/Particles)
[![Version](https://img.shields.io/cocoapods/v/Particles.svg?style=flat)](https://cocoapods.org/pods/Particles)
[![License](https://img.shields.io/cocoapods/l/Particles.svg?style=flat)](https://cocoapods.org/pods/Particles)
[![Platform](https://img.shields.io/cocoapods/p/Particles.svg?style=flat)](https://cocoapods.org/pods/Particles)

Particles is a native swift adaption of [particles.js](https://github.com/VincentGarreau/particles.js/) and inspired by [this stackoverflow question](https://stackoverflow.com/questions/43740338/swift-how-to-convert-a-particle-network-js-animation-to-ios).

## Installation

`Particles` is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Particles'
```

## Usage

You must import the `Particles` pod.

```swift
import Particles

let particlesView = ParticlesView(frame: view.frame)
view.addSubview(particlesView)
```

You can also initialize the `ParticlesView` with three optional parameters:
```swift

bgColor: UIColor = .clear                 // The color of the background of the view
particlesColor: UIColor = .black          // The color of the particles and the lines connecting them
density: ParticleDensity = .extraLight    // How densely packed the view is with particles

```

`ParticleDensity` has five cases:
```swift
.extraLight
.light
.normal
.dense
.extraDense
```

## Example

An example project is available in the ParticlesExample target to demonstrate the capabilities.

The default particles look is this:

![defaultparticles](https://user-images.githubusercontent.com/10342911/52456613-62df9d00-2b0a-11e9-9471-24d2e0dbd95e.png)

It can be greatly customized, such as like this:

![customparticles](https://user-images.githubusercontent.com/10342911/52456612-61ae7000-2b0a-11e9-8839-e72f09e5f6b9.png)

## License

`Particles` is available under the [MIT license](./LICENSE).
