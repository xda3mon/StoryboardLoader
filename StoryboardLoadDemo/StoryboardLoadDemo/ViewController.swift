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

enum Storyboard:
    String,
    StoryboardLoader {
    
    case one = "One"
    case another = "Another"
}

struct StoryboardStruct: RawRepresentable, StoryboardLoader, ExpressibleByStringLiteral {
    
    static var one: StoryboardStruct { return "One" }
    static var another: StoryboardStruct { return "Another" }
    
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
        navigationController?.pushViewController(Storyboard.another.instantiateViewController() as AnotherViewController, animated: true)
    }
}

class AnotherViewController: UIViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let _ = StoryboardStruct.one.instantiateInitialViewController()
    }
}

