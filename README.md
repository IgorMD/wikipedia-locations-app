# Wikipedia locations Demo App

A small app that displays a list of locations and opens them in wikipedia app.

# Requirements

* Xcode 15.0
* Swift 5
* SPM manager
* iOS 15+
* Modified Wikipedia app from (https://github.com/IgorMD/wikipedia-ios-deep-linking)

# Overview

* **Architecture**: This is a very small app so I decided to use swiftUI and MVVM. 
* **NetworkLayer** Is a small spm package agnostic of TCA that is reponsible for constructing and making HTTPS requests. The package is covered with unit tests.
* Dependencies handling are inspired from pointfree.co guys.
* Business logic is covered with unit tests


# What can be improved
* Better coverage with Snapshots test, UI tests
* Localizations
* Once the app grows it can be modularised based on the feature, UI components, Design system.
* Locations Api can be extracted in separate target/module/framework.