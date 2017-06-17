//
//  ViewController.swift
//  Storyboard
//
//  Created by What on 17/06/2017.
//  Copyright © 2017 What. All rights reserved.
//

import UIKit


/// storyboard ID of the view controller must be equal to the name of its class Type.
/// storyboard ID of the view controller must be equal to the name of its class Type.
/// storyboard ID of the view controller must be equal to the name of its class Type.

enum Storyboard<T: UIViewController>: String, StoryboardLoader {
    typealias ViewController = T
    case one = "One"
    case another = "Another"
}

struct StoryboardStruct<T: UIViewController>: RawRepresentable, StoryboardLoader, ExpressibleByStringLiteral {
    
    static var one: StoryboardStruct<T> { return "One" }
    static var another: StoryboardStruct<T> { return "Another" }
    
    typealias ViewController = T
    
    let rawValue: String
    
    init?(rawValue: String) {
        self.rawValue = rawValue
    }
    
    init(stringLiteral value: String) {
        rawValue = value
    }
    
    init(unicodeScalarLiteral value: String) {
        rawValue = value
    }
    
    init(extendedGraphemeClusterLiteral value: String) {
        rawValue = value
    }
}

class ViewController: UIViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(Storyboard<AnotherViewController>.another.value, animated: true)
    }
}

class AnotherViewController: UIViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(StoryboardStruct<ViewController>.one.value, animated: true)
    }
}

